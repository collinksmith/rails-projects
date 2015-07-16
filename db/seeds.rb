# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

BANDS = [{name: "The Beatles"},
         {name: "Radiohead"}]

ALBUMS = [{name: "Abbey Road", band_id: 1, year: 1969, recording_type: "studio"},
          {name: "A Hard Day's Night", band_id: 1, year: 1964, recording_type: "studio"},
          {name: "In Rainbows", band_id: 2, year: 2008, recording_type: "studio"}
        ]

TRACKS = [{album_id: 1, song_number: 1, name: "Come Together"},
          {album_id: 1, song_number: 2, name: "Something"},
          {album_id: 1, song_number: 3, name: "Maxwell's Silver Hammer"},
          {album_id: 1, song_number: 4, name: "Oh! Darling"},
          {album_id: 1, song_number: 5, name: "Octopus's Garden"},
          {album_id: 1, song_number: 6, name: "I Want You (She's So Heavy)"},
          {album_id: 1, song_number: 7, name: "Here Comes The Sun"},
          {album_id: 1, song_number: 8, name: "Because"},
          {album_id: 1, song_number: 9, name: "You Never Give Me Your Money"},
          {album_id: 1, song_number: 10, name: "Sun King"},
          {album_id: 1, song_number: 11, name: "Mean Mr. Mustard"},
          {album_id: 1, song_number: 12, name: "Polythene Pam"},
          {album_id: 1, song_number: 13, name: "She Came In Through The Bathroom Window"},
          {album_id: 1, song_number: 14, name: "Golden Slumbers"},
          {album_id: 1, song_number: 15, name: "Carry That Weight"},
          {album_id: 1, song_number: 16, name: "The End"},
          {album_id: 1, song_number: 17, name: "Her Majesty"},
          {album_id: 1, song_number: 18, name: "Abbey Road Documentary"},
          {album_id: 2, song_number: 1, name: "A Hard Day's Night"},
          {album_id: 2, song_number: 2, name: "I Should Have Known Better"},
          {album_id: 2, song_number: 3, name: "If I Fell"},
          {album_id: 2, song_number: 4, name: "I'm Happy Just To Dance With You"},
          {album_id: 2, song_number: 5, name: "And I Love Her"},
          {album_id: 2, song_number: 6, name: "Tell Me Why"},
          {album_id: 2, song_number: 7, name: "Can't Buy Me Love"},
          {album_id: 2, song_number: 8, name: "Any Time At All"},
          {album_id: 2, song_number: 9, name: "I'll Cry Instead"},
          {album_id: 2, song_number: 10, name: "Things We Said Today"},
          {album_id: 2, song_number: 11, name: "When I Get Home"},
          {album_id: 2, song_number: 12, name: "You Can't Do That"},
          {album_id: 2, song_number: 13, name: "I'll Be Back"},
          {album_id: 2, song_number: 14, name: "A Hard Day's Night Documentary"},
          {album_id: 3, song_number: 1, name: "15 Step"},
          {album_id: 3, song_number: 2, name: "Bodysnatchers"},
          {album_id: 3, song_number: 3, name: "Nude"},
          {album_id: 3, song_number: 4, name: "Medley: Weird Fishes/Arpeggiio"},
          {album_id: 3, song_number: 5, name: "All I Need"},
          {album_id: 3, song_number: 6, name: "Faust Arp"},
          {album_id: 3, song_number: 7, name: "Reckoner"},
          {album_id: 3, song_number: 8, name: "House of Cards"},
          {album_id: 3, song_number: 9, name: "Jigsaw Falling into Place"},
          {album_id: 3, song_number: 10, name: "Videotape"}
        ]

USERS = [{email: "joe@gmail.com", password: "joejoe"},
         {email: "bob@gmail.com", password: "bobbob"}]      

BANDS.each do |band| 
  Band.create!(name: band[:name])
end

ALBUMS.each do |album| 
  Album.create!(name:    album[:name],
                band_id: album[:band_id],
                year:    album[:year].to_s)
end

TRACKS.each do |track| 
  Track.create!(name: track[:name],
                album_id: track[:album_id],
                song_number: track[:song_number])
end

USERS.each do |user|
  User.create!(email: user[:email], password: user[:password])
end