___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Unique ID Generator",
  "description": "generates a unique id based on a random id for every page.",
  "containerContexts": [
    "WEB"
  ],
  "categories": [
    "UTILITY"
  ],
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "prefix",
    "displayName": "Prefix",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "random-length",
    "displayName": "Random Length",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const getTimestampMillis = require('getTimestampMillis');
const generateRandom = require('generateRandom');
const Math = require('Math');
const makeNumber = require('makeNumber');

// Config
var prefix = (data.prefix || 'dot').toUpperCase();
var randomLength = data['random-length'] || 10;

// Try reuse page/session id
var eventId = copyFromWindow('_randomPageId');

if (!eventId) {
  var ms = getTimestampMillis();
  if (typeof ms !== 'number') {
    ms = makeNumber(ms);
  }

  // Ensure ms is a safe integer string
  var msString = '' + ms;

  // build random suffix
  var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  var rand = '';
  for (var i = 0; i < randomLength; i++) {
    var idx = generateRandom(0, chars.length - 1);
    rand = rand + chars.charAt(idx);
  }

  eventId = msString + '-' + rand;
  setInWindow('_randomPageId', eventId, false);
}

return prefix + '-' + eventId;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_randomPageId"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 11/15/2025, 8:33:19 PM


