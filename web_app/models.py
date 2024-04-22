from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Artist(db.Model):
    __tablename__ = 'artist'

    artist_id = db.Column(db.String(255), primary_key=True)
    artist_name = db.Column(db.String(255), nullable=False)

class EventArtistBridge(db.Model):
    __tablename__ = 'event_artist_bridge'

    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.String(255), nullable=False)  # Assuming event_id is present in the bridge table
    artist_id = db.Column(db.String(255), db.ForeignKey('artist.artist_id'), nullable=False)

    # Define relationship to Artist
    artist = db.relationship('Artist', backref='event_artist_bridge')
