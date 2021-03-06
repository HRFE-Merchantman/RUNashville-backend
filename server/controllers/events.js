/* eslint-disable camelcase */
const models = require('../models');

module.exports = {
  getAllEvents(req, res) {
    models.events.getAllEvents((result) => {
      if (result.length !== 0) {
        res.status(200).send(result);
      } else {
        res.status(204).send('No Events Found');
      }
    });
  },
  getAllPromotedEvents(req, res) {
    models.events.getAllPromotedEvents((result) => {
      if (result.length !== 0) {
        res.status(200).send(result);
      } else {
        res.status(204).send('No Events Found');
      }
    });
  },
  getAllReportedEvents(req, res) {
    models.events.getAllReportedEvents((result) => {
      if (result.length !== 0) {
        res.status(200).send(result);
      } else {
        res.status(204).send('No Events Found');
      }
    });
  },
  getHiddenEvents(req, res) {
    models.events.getHiddenEvents((result) => {
      if (result.length !== 0) {
        res.status(200).send(result);
      } else {
        res.status(204).send('No Events Found');
      }
    });
  },
  getEventsCreatedByUser(req, res) {
    const { id } = req.params;
    models.events.getEventsCreatedByUser(id, (result) => {
      if (result.length !== 0) {
        res.status(200).send(result);
      } else {
        res.status(204).send('No Events Found');
      }
    });
  },
  postNewEvent(req, res) {
    const {
      event_type_id, description_events, difficulty_level_id,
      leader_user_id, start_time, end_time, start_location, end_location, image_url,
      thumbnail_photo, running_distance, link, map_url, event_title,
    } = req.body;
    const data = [event_title, description_events, event_type_id, difficulty_level_id, leader_user_id, start_time, end_time, start_location, end_location, image_url, thumbnail_photo, running_distance, link, map_url];
    models.events.postNewEvent(data, (err, result) => {
      if (err) {
        res.status(404).send(err);
      } else {
        res.status(204).send(result);
      }
    });
  },
};
