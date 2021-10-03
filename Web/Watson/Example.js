const fs = require('fs');
const SpeechToTextV1 = require('ibm-watson/speech-to-text/v1');

/* * * * *
 * IBM CLOUD: Use the following code only to
 * authenticate to IBM Cloud.
 * * * * */

const { IamAuthenticator } = require('ibm-watson/auth');
const speechToText = new SpeechToTextV1({
  authenticator: new IamAuthenticator({
    apikey: 'GN_CUFHBOPc4xujUn0tylY8VcSrKTve_PqmI24-zItlq',
  }),
  serviceUrl: 'https://api.us-south.speech-to-text.watson.cloud.ibm.com/instances/8f6d54f8-3609-45e3-b65d-ce9ee52783d5',
});

/* * * * *
 * IBM CLOUD PAK FOR DATA: Use the following code
 * only to authenticate to IBM Cloud Pak for Data.
 * * * * */

// const { CloudPakForDataAuthenticator } = require('ibm-watson/auth');
// const speechToText = new SpeechToTextV1({
//   authenticator: new CloudPakForDataAuthenticator({
//     username: '{username}',
//     password: '{password}',
//     url: 'https://{cpd_cluster_host}{:port}',
//  }),
//  serviceUrl: '{url}',
// });

const params = {
  objectMode: true,
  contentType: 'audio/flac',
  model: 'en-US_BroadbandModel',
  keywords: ['colorado', 'tornado', 'tornadoes'],
  keywordsThreshold: 0.5,
  maxAlternatives: 3,
};

// Create the stream.
const recognizeStream = speechToText.recognizeUsingWebSocket(params);

// Pipe in the audio.
fs.createReadStream('audio-file.flac').pipe(recognizeStream);

/*
 * Uncomment the following two lines of code ONLY if `objectMode` is `false`.
 *
 * WHEN USED TOGETHER, the two lines pipe the final transcript to the named
 * file and produce it on the console.
 *
 * WHEN USED ALONE, the following line pipes just the final transcript to
 * the named file but produces numeric values rather than strings on the
 * console.
 */
// recognizeStream.pipe(fs.createWriteStream('transcription.txt'));

/*
 * WHEN USED ALONE, the following line produces just the final transcript
 * on the console.
 */
// recognizeStream.setEncoding('utf8');

// Listen for events.
recognizeStream.on('data', function(event) { onEvent('Data:', event); });
recognizeStream.on('error', function(event) { onEvent('Error:', event); });
recognizeStream.on('close', function(event) { onEvent('Close:', event); });

// Display events on the console.
function onEvent(name, event) {
    console.log(name, JSON.stringify(event, null, 2));
};
