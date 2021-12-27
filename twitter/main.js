// you put this in the console in F12
//chrome
var list = ['Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua & Deps', 'Argentina', 'Armenia', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus',
'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia Herzegovina', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Central African Rep',
'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo', 'Congo {Democratic Rep}', 'Costa Rica', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'East Timor',
'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea',
'Guinea-Bissau', 'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland {Republic}', 'Israel', 'Italy', 'Ivory Coast', 'Jamaica', 'Japan', 'Jordan',
'Kazakhstan', 'Kenya', 'Kiribati', 'Korea North', 'Korea South', 'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macedonia',
'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique',
'Myanmar, (Burma)', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Panama', 'Papua New Guinea', 'Paraguay',
'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania', 'Russian Federation', 'Rwanda', 'St Kitts & Nevis', 'St Lucia', 'Saint Vincent & the Grenadines', 'Samoa', 'San Marino', 'Sao Tome & Principe',
'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname',
'Swaziland', 'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Togo', 'Tonga', 'Trinidad & Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine',
'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican City', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'];
var count = list.length;

function delay(time) {
  return new Promise(resolve => setTimeout(resolve, time));
}

while (true) {
	for(var i = 0; i < count; i++) {
	    var item = list[i];
	    await delay(1000);
		fetch("https://twitter.com/i/api/graphql/XyvN0Wv13eeu_gVIHDi10g/CreateTweet", {
		    "headers": {
			    "accept": "*/*",
			    "accept-language": "en-US,en;q=0.9",
			    "authorization": "", // bearer token here
			    "content-type": "application/json",
			    "sec-ch-ua": "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"96\", \"Google Chrome\";v=\"96\"",
			    "sec-ch-ua-mobile": "?0",
			    "sec-ch-ua-platform": "\"Windows\"",
			    "sec-fetch-dest": "empty",
			    "sec-fetch-mode": "cors",
			    "sec-fetch-site": "same-origin",
			    "x-csrf-token": "",
			    "x-twitter-active-user": "yes",
			    "x-twitter-auth-type": "OAuth2Session",
			    "x-twitter-client-language": "en"
	        },
			"referrer": "https://twitter.com/home",
			"referrerPolicy": "strict-origin-when-cross-origin",
			"body": '{\"variables\":\"{\\\"tweet_text\\\":\\\"Fuck ' + item + '\\\",\\\"media\\\":{\\\"media_entities\\\":[],\\\"possibly_sensitive\\\":false},\\\"withDownvotePerspective\\\":false,\\\"withReactionsMetadata\\\":false,\\\"withReactionsPerspective\\\":false,\\\"withSuperFollowsTweetFields\\\":true,\\\"withSuperFollowsUserFields\\\":true,\\\"semantic_annotation_ids\\\":[],\\\"dark_request\\\":false,\\\"withBirdwatchPivots\\\":false}\",\"queryId\":\"XyvN0Wv13eeu_gVIHDi10g\"}',
			"method": "POST",
			"mode": "cors",
			"credentials": "include"
		});
	}
}
