#!/usr/bin/env python3
"""List all documents in Python
in a school having specific topic
"""

def schools_by_topic(mongo_collection, topic):
  topic_filter = {
    'topics': {
      '$elemMatch': {
        '$eq': topic,
      },
    },
  }
  return [doc for doc in mongo_collection.find(topic_filter)]