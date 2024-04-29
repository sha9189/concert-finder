from helpers import load_config
import requests
import time
from tqdm import tqdm

config = load_config()

def fetch_api_data_by_page_num(page_num):
    """Function that makes API call and returns list of events, each event being in json format"""
    init_url = config["API"]["API_URL"]
    url = init_url.replace("{PAGE_NUM}", str(page_num))
    payload = {}
    headers = {}
    response = requests.request("GET", url, headers=headers, data=payload)
    response_json = response.json()
    events_json = response_json['_embedded']['events']
    events = [event_json for event_json in events_json]
    return events


def fetch_api_data(page_limit=None):
    """Function that makes API call and returns list of events, each event being in json format"""
    init_url = config["API"]["API_URL"]
    page_num = 1
    url = init_url.replace("{PAGE_NUM}", str(page_num))
    payload = {}
    headers = {}
    response = requests.request("GET", url, headers=headers, data=payload)
    response_json = response.json()
    totalPages = int(response_json["page"]["totalPages"])
    if page_limit:
        totalPages = min(totalPages, page_limit)
    events = []
    for page_num in tqdm(range(1, totalPages+1)):
        url = init_url.replace("{PAGE_NUM}", str(page_num))
        payload = {}
        headers = {}
        response = requests.request("GET", url, headers=headers, data=payload)
        response_json = response.json()
        events_json = response_json['_embedded']['events']
        page_events = [event_json for event_json in events_json]
        events += page_events
        time.sleep(20)
    return events