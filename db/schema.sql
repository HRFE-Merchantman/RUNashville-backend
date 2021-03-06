DROP DATABASE IF EXISTS runashville;

CREATE DATABASE runashville;

USE runashville;

CREATE TABLE user_type (
  id INT AUTO_INCREMENT,
  name_user_type VARCHAR(20),
  description_user_type TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE user (
  id INT AUTO_INCREMENT,
  name_user VARCHAR(30),
  last_name VARCHAR(50),
  password_user VARCHAR(100),
  address_user VARCHAR(100),
  email VARCHAR(40),
  fk_user_type_id INT,
  banned BOOLEAN,
  image_url VARCHAR(1000),
  banner_url VARCHAR(1000),
  bio_description TEXT,
  approved BOOLEAN,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_user_type_id) REFERENCES user_type(id)
);

CREATE TABLE friends (
  id INT AUTO_INCREMENT,
  fk_source_user_id INT,
  fk_target_user_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status_friends BOOLEAN,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_source_user_id) REFERENCES user(id),
  FOREIGN KEY (fk_target_user_id) REFERENCES user(id)
);

CREATE TABLE post (
  id INT AUTO_INCREMENT,
  fk_user_id INT,
  image_url VARCHAR(200),
  message_post TEXT,
  reported BOOLEAN DEFAULT false,
  hide_post BOOLEAN DEFAULT false,
  location_post VARCHAR(200),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

CREATE TABLE stats (
  id INT AUTO_INCREMENT,
  fk_post_id INT,
  distance DECIMAL(5,3),
  time_hour INT,
  time_minutes INT,
  time_seconds INT,
  pace INT,
  heart_rate INT,
  steps INT,
  calories_burned INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_post_id) REFERENCES post(id)
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT,
  fk_post_id INT,
  fk_user_id INT,
  message_comments TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_post_id) REFERENCES post(id),
  FOREIGN KEY (fk_user_id) REFERENCES user(id)
);

CREATE TABLE reactions (
  id INT AUTO_INCREMENT,
  name_reactions VARCHAR(20),
  description_reactions TEXT,
  icon varchar(200),
  PRIMARY KEY (id)
);

CREATE TABLE reactions_on_post (
  id INT AUTO_INCREMENT,
  fk_post_id INT,
  fk_user_id INT,
  fk_reaction_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_post_id) REFERENCES post(id),
  FOREIGN KEY (fk_user_id) REFERENCES user(id),
  FOREIGN KEY (fk_reaction_id) REFERENCES reactions(id)
);

CREATE TABLE event_type (
  id INT AUTO_INCREMENT,
  name_event_type VARCHAR(50),
  description_event_type TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE difficulty_level (
  id INT AUTO_INCREMENT,
  name_difficulty_level VARCHAR(30),
  description_difficulty_level TEXT,
  PRIMARY KEY (id)
);

CREATE TABLE events (
  id INT AUTO_INCREMENT,
  event_title VARCHAR(40),
  description_events TEXT,
  reported BOOLEAN DEFAULT false,
  hide_event BOOLEAN DEFAULT false,
  fk_event_type_id INT,
  fk_difficulty_level_id INT,
  fk_leader_user_id INT,
  official BOOLEAN DEFAULT true,
  start_time DATETIME,
  end_time DATETIME,
  start_location VARCHAR(100),
  end_location VARCHAR(100),
  image_url VARCHAR(200),
  thumbnail_photo VARCHAR(200),
  running_distance DECIMAL(5,2),
  link VARCHAR(200),
  map_url TEXT,
  attendees INT,
  promoted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_event_type_id) REFERENCES event_type(id),
  FOREIGN KEY (fk_difficulty_level_id) REFERENCES difficulty_level(id),
  FOREIGN KEY (fk_leader_user_id) REFERENCES user(id)
);

CREATE TABLE user_type_for_event_type (
  id INT AUTO_INCREMENT,
  fk_event_type_id INT,
  fk_user_type_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_event_type_id) REFERENCES event_type(id),
  FOREIGN KEY (fk_user_type_id) REFERENCES user_type(id)
);


INSERT INTO user_type (name_user_type, description_user_type) VALUES ('Community Member', 'Just a regular user on the platform');

/* Insert new users in USER table */

INSERT INTO user (name_user, last_name, password_user, address_user, email, fk_user_type_id, banned, image_url, banner_url, bio_description) VALUES ('Jodi', 'Silverman', '497daa66aebfefcccd1f3c46dcd59d64210b31ebb41b7a17acdfd4dc4cff367b', '21 Jump Street', 'jodi@21Jump.com', 1, false, 'https://media-exp1.licdn.com/dms/image/C4D03AQGb2LV3vUqt6Q/profile-displayphoto-shrink_800_800/0/1616525518088?e=1623283200&v=beta&t=_HOXvWSGo6RP4IumxWAyUCYiTU7c3SMo5geGN2sqbNs', 'https://cdn.britannica.com/84/73184-004-E5A450B5/Sunflower-field-Fargo-North-Dakota.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO user (name_user, last_name, password_user, address_user, email, fk_user_type_id, banned, image_url, banner_url, bio_description) VALUES ('Daniel', 'Doyle', '497daa66aebfefcccd1f3c46dcd59d64210b31ebb41b7a17acdfd4dc4cff367b', '21 Jump Street', 'daniel@21Jump.com', 1, false, 'https://media-exp1.licdn.com/dms/image/C4E03AQGFmWXduIV_Iw/profile-displayphoto-shrink_800_800/0/1533059495913?e=1623283200&v=beta&t=PnT8-NVJhqO6kl5rERys8mEb2mS1q_8BuaNF-kq7ovQ', 'https://media-exp1.licdn.com/dms/image/C5616AQEOKvd6zJjtlg/profile-displaybackgroundimage-shrink_200_800/0/1600785720704?e=1623283200&v=beta&t=Ndkcc-NglerNTm15iR8F3g8_a297MnPwhtZi8D1XY6k', 'This is my profile! It is a test, so no judgment please.');
INSERT INTO user (name_user, last_name, password_user, address_user, email, fk_user_type_id, banned, image_url, banner_url, bio_description) VALUES ('Phil', 'Teves', '497daa66aebfefcccd1f3c46dcd59d64210b31ebb41b7a17acdfd4dc4cff367b', '21 Jump Street', 'phil@21Jump.com', 1, false, 'https://media-exp1.licdn.com/dms/image/C4E03AQE_LoUV3hoUGg/profile-displayphoto-shrink_800_800/0/1616439062777?e=1623283200&v=beta&t=imxyU2JdwSm2rFNAYSXCts9H2_srazLN_3s0XjUhWhQ', 'https://www.tbf.org/-/media/tbf/images/funds/boston-skyline-dusk-covid-banner.jpg?h=516&w=1290&la=en&hash=31E68F53D6A5A8934BFD2984CD91189014C7E801', 'You from Boston? I suppose you think you''re better than me?');

/* CREATE REACTIONS */
INSERT INTO reactions (name_reactions, description_reactions) values ('like', 'when you like a post, say it!');

/* CREATE FRIENDS LISTS */
INSERT INTO friends (fk_source_user_id, fk_target_user_id, status_friends) VALUES (1, 2, true);
INSERT INTO friends (fk_source_user_id, fk_target_user_id, status_friends) VALUES (1, 3, true);
INSERT INTO friends (fk_source_user_id, fk_target_user_id, status_friends) VALUES (2, 3, true);

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (1, 'https://simplifaster.com/wp-content/uploads/2017/01/Seaside-Runner.jpg','I am such a fast runner, look how fast I can go wheeeee', false, false, 'Nashville');

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (1, null,'Gotta go fast', false, false, 'Shelby Bottom');

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (2, 'https://simplifaster.com/wp-content/uploads/2017/01/Seaside-Runner.jpg','I am such a fast runner, look how fast I can go wheeeee', true, false, 'Nashville');

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (3, null,'I have these runs', true, false, 'Hateful Hater');

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (1, 'https://simplifaster.com/wp-content/uploads/2017/01/Seaside-Runner.jpg','I am such a stupid runner, look how slow I can go wheeeee', true, true, 'Nashville');

INSERT INTO post (fk_user_id, image_url, message_post, reported, hide_post, location_post) VALUES (2, null,'Gotta get rid of this Group', true, true, 'Hateful Hater');

INSERT INTO comments (fk_post_id, fk_user_id, message_comments) VALUES (1, 1, 'cool story bro');
INSERT INTO comments (fk_post_id, fk_user_id, message_comments) VALUES (1, 2, 'WOWOW');

INSERT INTO stats (fk_post_id, distance, time_hour, time_minutes, time_seconds, pace, heart_rate, steps, calories_burned) VALUES (2, 5.12, 1, 30, 15, 7.30, 120, 5151, 5.12);

INSERT INTO user_type (name_user_type, description_user_type) VALUES ('Community Admin', 'Able to create official events and remove users/user posts');
INSERT INTO user_type (name_user_type, description_user_type) VALUES ('Super Admin', 'Able to create official events and remove users/user posts');

INSERT INTO user (name_user, last_name, password_user, address_user, email, fk_user_type_id, banned, created_at) VALUES ('Jack', 'McClane', 'password', 'Nashville', 'jack@nashville.com', 3, false, '2021-04-05');
INSERT INTO user (name_user, last_name, password_user, address_user, email, fk_user_type_id, banned, created_at) VALUES ('Hans', 'Gruber', 'password', 'Nashville', 'hans@nashville.com', 2, false, '2021-04-05');

INSERT INTO event_type (name_event_type, description_event_type) VALUES ('race', 'The big race');
INSERT INTO event_type (name_event_type, description_event_type) VALUES ('daily_run', 'Just a daily run');
INSERT INTO event_type (name_event_type, description_event_type) VALUES ('other', 'This could be a volunteer event or something else');

INSERT INTO difficulty_level (name_difficulty_level, description_difficulty_level) VALUES ('beginner', 'You know, kid stuff');
INSERT INTO difficulty_level (name_difficulty_level, description_difficulty_level) VALUES ('intermediate', 'No pain, no gain');
INSERT INTO difficulty_level (name_difficulty_level, description_difficulty_level) VALUES ('advanced', 'Now we are talking');

-- Updated Races
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (1, 3, 2, 'Hilltop Half-Marathon', true, 'Test your endurance in the hills of Nashville.', '2021-04-30T08:30:00', '2021-04-30T10:30:00', 'The Hill Top at West 25th St', 'The Hill Top at West 25th St', 'https://d368g9lw5ileu7.cloudfront.net/races/races-65xxx/65176/raceBanner-lmjEWjkW-bCRlO4.png', './images/nashville.jpeg', 8.5, "https://www.runnash.com/races/music-city-july-4th-virtual-5k/", '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=11325&amp;f=3d17d1995d&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=Wqby6lhmoGOBe3t1Ca1Ca1Ec1CY1OB4Co1PIOk1Ne1s3i1Y4m3aAY3c9a3e96Kc1k3u1c5g1_3g3oBi2g9c4uGc1m4s1s6W2w7W1u3e1a4y1e5e2W5i2m4a2c3w2m3gAmBu2s2u1k1v2y5x1s7Po4Vu4X1Y5r1a6X1c3t1i4f1s3JW42e7~68X64v40L2~2BN8Ti1HDj1f1Z4v4d1c1TGV2d17v2FT0t1Lv16x2u1~2Y3FM5E7INg35c32c1Aa16W16c28e14k11m47i3Fc2De10y1Aw14g2GKKIEM8e1Ce1Ku1q1y2Cg1By1NW2p1s1o2c4GAw11o1g1m1u2s1e7Se2g2s3c1u2e2Y3a2W2q3o5Hg2IW2Gw2Ki1GOFNJh1Fv2H~1If2p3n5Z2~1d2X3b1t2f2r3Rd2r1d7l1t2n1f1v12F9n2b4q1r1O~1Cx1Bf1p1x2Jt1Bd17d1DLJHFJ3f29v10x1Ed1Gb28h32l43j17d15b25V9Z11b16b3Of38H6DGLW3X3y2t1w15u1MU0w2Ge18W11UFe1b1f3n5pArIz4h8x2Z4x2v3r6b8r9hB~3b4l5~4p1f1f6v4f6p4n9x6h6t4n2d2b2b2j2v2l2f3p1h2b1~1f2h4r1v3BZ1Tb2Jx1Th3Hb2Rl4F~3r1tJz1lN17"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 150, true, '2021-04-05 00:00:00', '2021-04-09 00:00:00', false, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (1, 2, 2, 'Second Chance Half-Marathon', true, 'Kick off your Music City JULY 4TH celebration with a run through downtown Nashville! Bring the whole family to kick off your city celebrations with this traditional run/walk through downtown Nashville.', '2021-04-30T08:30:00', '2021-04-30T10:30:00', 'Cumberland Park', 'Cumberland Park', 'https://phase-iv.com/wp-content/uploads/2017/11/15062_BLG_PST_RunningWeightLoss_BANNER.jpg', './images/nashville.jpeg', 8.5, "https://www.runnash.com/races/music-city-july-4th-virtual-5k/", '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=11325&amp;f=3d17d1995d&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=Wqby6lhmoGOBe3t1Ca1Ca1Ec1CY1OB4Co1PIOk1Ne1s3i1Y4m3aAY3c9a3e96Kc1k3u1c5g1_3g3oBi2g9c4uGc1m4s1s6W2w7W1u3e1a4y1e5e2W5i2m4a2c3w2m3gAmBu2s2u1k1v2y5x1s7Po4Vu4X1Y5r1a6X1c3t1i4f1s3JW42e7~68X64v40L2~2BN8Ti1HDj1f1Z4v4d1c1TGV2d17v2FT0t1Lv16x2u1~2Y3FM5E7INg35c32c1Aa16W16c28e14k11m47i3Fc2De10y1Aw14g2GKKIEM8e1Ce1Ku1q1y2Cg1By1NW2p1s1o2c4GAw11o1g1m1u2s1e7Se2g2s3c1u2e2Y3a2W2q3o5Hg2IW2Gw2Ki1GOFNJh1Fv2H~1If2p3n5Z2~1d2X3b1t2f2r3Rd2r1d7l1t2n1f1v12F9n2b4q1r1O~1Cx1Bf1p1x2Jt1Bd17d1DLJHFJ3f29v10x1Ed1Gb28h32l43j17d15b25V9Z11b16b3Of38H6DGLW3X3y2t1w15u1MU0w2Ge18W11UFe1b1f3n5pArIz4h8x2Z4x2v3r6b8r9hB~3b4l5~4p1f1f6v4f6p4n9x6h6t4n2d2b2b2j2v2l2f3p1h2b1~1f2h4r1v3BZ1Tb2Jx1Th3Hb2Rl4F~3r1tJz1lN17"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 23, true, '2021-04-05 00:00:00', '2021-04-09 00:00:00', false, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (1, 1, 2, 'Music City 5k', true, 'We know many of you have diligently trained for this very day, so we are excited to present another opportunity for you to chase your 13.1 mile goal in Nashville on 4/24! This is a live, in-person race! Your participation will provide hope for children aging out of orphanages in Haiti & Uganda.', '2021-04-30T08:30:00', '2021-04-30T10:30:00', 'Percy Warner Park', 'Percy Warner Park', './images/nashville.jpeg', './images/nashville.jpeg', 8.5, "https://www.runnash.com/races/music-city-july-4th-virtual-5k/", '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=11325&amp;f=3d17d1995d&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=Wqby6lhmoGOBe3t1Ca1Ca1Ec1CY1OB4Co1PIOk1Ne1s3i1Y4m3aAY3c9a3e96Kc1k3u1c5g1_3g3oBi2g9c4uGc1m4s1s6W2w7W1u3e1a4y1e5e2W5i2m4a2c3w2m3gAmBu2s2u1k1v2y5x1s7Po4Vu4X1Y5r1a6X1c3t1i4f1s3JW42e7~68X64v40L2~2BN8Ti1HDj1f1Z4v4d1c1TGV2d17v2FT0t1Lv16x2u1~2Y3FM5E7INg35c32c1Aa16W16c28e14k11m47i3Fc2De10y1Aw14g2GKKIEM8e1Ce1Ku1q1y2Cg1By1NW2p1s1o2c4GAw11o1g1m1u2s1e7Se2g2s3c1u2e2Y3a2W2q3o5Hg2IW2Gw2Ki1GOFNJh1Fv2H~1If2p3n5Z2~1d2X3b1t2f2r3Rd2r1d7l1t2n1f1v12F9n2b4q1r1O~1Cx1Bf1p1x2Jt1Bd17d1DLJHFJ3f29v10x1Ed1Gb28h32l43j17d15b25V9Z11b16b3Of38H6DGLW3X3y2t1w15u1MU0w2Ge18W11UFe1b1f3n5pArIz4h8x2Z4x2v3r6b8r9hB~3b4l5~4p1f1f6v4f6p4n9x6h6t4n2d2b2b2j2v2l2f3p1h2b1~1f2h4r1v3BZ1Tb2Jx1Th3Hb2Rl4F~3r1tJz1lN17"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 75, true, '2021-04-05 00:00:00', '2021-04-09 00:00:00', false, false);


-- Updated Daily Runs (Official)
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 2, 2, 'Morning Jaunt', true, 'Join us for a lesiurely early morning 5k along the lake in beautiful Centennial Park', '2021-04-11T06:00:00', '2021-04-11T07:30:00', 'Centennial Park', 'Centennial Park', null, 'https://apex-hp.com/wp-content/uploads/2020/07/shutterstock_266758136.0.0.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', false, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 1, 3, 'Late Morning Skip', true, 'Meet at the park entrance for a late morning 5k', '2021-04-15T08:30:00', '2021-04-16T09:30:00', 'Fannie Mae Dees Park', 'Fannie Mae Dees Park', null, 'https://assets3.thrillist.com/v1/image/1752291/381x254/crop;jpeg_quality=65.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', false, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 3, 3, 'Midday Sprint', true, 'Meet at building entrance for a midday sprint', '2021-04-15T11:00:00', '2021-04-16T12:30:00', 'Shelby Park Community Center', 'Shelby Park Community Center', null, 'https://assets3.thrillist.com/v1/image/1752293/1000x666.6666666666666/flatten;crop;jpeg_quality=70', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', false, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 2, 3, 'Afternoon Scamper', true, 'Run away quick', '2021-04-23T16:00:00', '2021-04-23T17:30:00', 'Fannie Mae Dees Park', 'Fannie Mae Dees Park', null, 'http://www.nashville.gov/portals/0/SiteContent/Parks/images/greenways/HYSA%20Bridge.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', false, false);


-- reported and hidden
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 1, 3, 'Late Night Scramble', true, 'We want to run in random directions', '2021-04-15T08:30:00', '2021-04-16T09:30:00', 'Choose a park', 'Choose a park', null, 'https://nmcdn.io/bf48b01813174d27941cb0fe2037c1cb/77368fbc60d84cb5bfb3cb7d7ec793b5/files/wheretorun/Trent-Rosenbloom-t-Harpeth-River-Greenway.-e1525676940946-process-s600x440.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', true, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 3, 3, 'Crepuscular Tango', true, 'We prefer dancing to running', '2021-04-15T11:00:00', '2021-04-16T12:30:00', 'The middle of the street', 'The middle of the street', null, 'https://juliehullett.com/wp-content/uploads/2015/09/Shelby-Bottoms-Greenway-Nashville-Julie-Hullett-Concierge.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', true, false);
INSERT INTO events (fk_event_type_id, fk_difficulty_level_id, fk_leader_user_id, event_title, official, description_events, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url, attendees, promoted, created_at, updated_at, reported, hide_event) VALUES (2, 2, 3, 'Twilight Twirl', true, 'Spin in place', '2021-04-23T16:00:00', '2021-04-23T17:30:00', 'Your backyard', 'Your backyard', null, 'https://i.pinimg.com/originals/6e/16/e1/6e16e12823412a1d668bf19bf4d7eb22.jpg', 3.1, 'link', '<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://onthegomap.com/?m=r&amp;u=mi&amp;w%5B%5D=Routes+may+not+be+suitable+for+public+use.&amp;c%5B%5D=Route+data+%C2%A92021+On+The+Go+Map%2C+OpenStreetMap+Contributors&amp;d=4951&amp;f=8dbf31302b&amp;n=1&amp;dm=1&amp;context=embed&amp;r2=yrsy6nyroG1Fb1~1LLb2h1b1Rb1d12b26d31Z52T8Rt3d2x1Tf2NtDn3d19d3Ln13x1Ab1GTKLGl1g1h2i2LMPO78f1c1NGt1MZ18h14H1j2Hf6v2b3Rd2Bp20p2Cd20x19z2Ph2PB7F7X1Lb5j4b1Lp3l1f2Hz4Jb2DX3Rf2TX1LX2f2FHh2b2p1Tp1Pp4f1f1Fn1TJDj2l2b1Rr1T~1Fb169f1HNx2X2VPNX1DV7Z12VKp1i3x6e2j5Ch14P4X10Z10N7l2B~1Z1X3h3Z7f2h4r2b5z7~DX1X1HJF7F0LGd1g1N8z1Gf1Ed14LBFHZ2Hb8Tl3Tz1Fh15X1Cd1IX14d17r1Hx2h1l3Lp1Fp5h2t1BZ1FTJr1~1L5Z1QZ1K"></iframe><br/><small><a href="https://onthegomap.com" style="color:#0000FF;text-align:left" target="_blank">On The Go Map</a></small>', 12, true, '2021-04-01 00:00:00', '2021-04-09 00:00:00', true, true);


-- Other
INSERT INTO events (fk_event_type_id, event_title, description_events, official, start_time, end_time, start_location, end_location, running_distance, attendees, promoted, created_at, updated_at, thumbnail_photo, map_url, reported, hide_event) VALUES (3, 'Join Our Weekly Newsletter', 'Want to be in the know about what is going on in the Nashville running scene? Check out the official RUNashville newsletter!', true, '2021-04-08T06:00:00', '2021-04-05T07:30:00', 'Centennial Park, West End Ave Entrance', 'Centennial Park, West End Ave Entrance', 3.1, 12, true, '2021-04-05 00:00:00', '2021-04-05 00:00:00', 'https://c.tadst.com/gfx/1200x630/i-nl101.png?1', 'https://c.tadst.com/gfx/1200x630/i-nl101.png?1', false, false);
INSERT INTO events (fk_event_type_id, event_title, description_events, official, start_time, end_time, start_location, end_location, running_distance, attendees, promoted, created_at, updated_at, thumbnail_photo, map_url, reported, hide_event) VALUES (3, 'Volunteer With Habitat for Humanity', 'Learn how you can help make our community a better place!', true, '2021-04-08T08:30:00', '2021-04-05T10:00:00', 'Fannie Mae Dees Park', 'Fannie Mae Dees Park', 3.1, 12, true, '2021-04-05 00:00:00', '2021-04-05 00:00:00', 'https://www.habitatoakland.org/wp-content/uploads/2019/04/volunteer-header-1024x512.jpg', 'https://www.habitatoakland.org/wp-content/uploads/2019/04/volunteer-header-1024x512.jpg', false, false);


-- reported and hidden
INSERT INTO events (fk_event_type_id, event_title, description_events, official, start_time, end_time, start_location, end_location, running_distance, attendees, promoted, created_at, updated_at, thumbnail_photo, map_url, reported, hide_event) VALUES (3, 'Farewell to the Founder', 'We are firing our founder, but having cake about it.', true, '2021-04-08T06:00:00', '2021-04-05T07:30:00', '123 Street', '123 Street', 3.1, 12, true, '2021-04-05 00:00:00', '2021-04-05 00:00:00', 'https://cloudfront.traillink.com/photos/peeler-park-greenway_154348_sc.jpg', 'https://cloudfront.traillink.com/photos/peeler-park-greenway_154348_sc.jpg', true, false);
INSERT INTO events (fk_event_type_id, event_title, description_events, official, start_time, end_time, start_location, end_location, running_distance, attendees, promoted, created_at, updated_at, thumbnail_photo, map_url, reported, hide_event) VALUES (3, 'Clean Up The Park', 'There is so much trash!', true, '2021-04-08T08:30:00', '2021-04-05T10:00:00', 'The Trashy Park', 'The Trashy Park', 3.1, 12, true, '2021-04-05 00:00:00', '2021-04-05 00:00:00', 'https://www.cloudhiking.com/assets/images/metro/ashlandCityGreen/railway-bridge.jpg', 'https://www.cloudhiking.com/assets/images/metro/ashlandCityGreen/railway-bridge.jpg', true, false);
INSERT INTO events (fk_event_type_id, event_title, description_events, official, start_time, end_time, start_location, end_location, running_distance, attendees, promoted, created_at, updated_at, thumbnail_photo, map_url, reported, hide_event) VALUES (3, 'Chocolate Tour', 'Walk around and eat chocolate.', true, '2021-04-08T06:00:00', '2021-04-05T07:30:00', 'Magnolia Bakery', 'Magnolia Bakery', 3.1, 12, true, '2021-04-05 00:00:00', '2021-04-05 00:00:00', 'https://greatruns.com/wp-content/uploads/2016/06/Stones-River-Greenway.jpg','https://greatruns.com/wp-content/uploads/2016/06/Stones-River-Greenway.jpg', true, true);


/* MOCK EMAIL: Jodi@21Jump.com
  MOCK PASSWORD: Jodi
*/


/*  Execute this file from the command line by typing:
 *    mysql -u root -p < db/schema.sql
 *  to create the database and the tables.*/
