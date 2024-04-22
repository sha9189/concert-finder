from flask import Blueprint, render_template, request
from models import EventArtistBridge, Artist

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    # Get artist_id from query parameter
    artist_id = request.args.get('artist_id')

    # Query events for the selected artist_id
    if artist_id:
        events = EventArtistBridge.query.filter_by(artist_id=artist_id).all()
    else:
        events = EventArtistBridge.query.all()

    # Query all artists for dropdown menu
    artists = Artist.query.all()

    return render_template('index.html', events=events, artists=artists, selected_artist=artist_id)
