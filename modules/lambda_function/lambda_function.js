const https = require('https');

exports.handler = async (event) => {
    const url = 'https://api.ipify.org?format=json'; // Example API to get public IP

    try {
        return await new Promise((resolve, reject) => {
            https.get(url, (resp) => {
                let data = '';

                // Receive data chunks
                resp.on('data', (chunk) => {
                    data += chunk;
                });

                // Complete response
                resp.on('end', () => {
                    resolve(JSON.parse(data));
                });

            }).on("error", (err) => {
                reject(new Error(`Request failed: ${err.message}`));
            });
        });
    } catch (error) {
        return { error: error.message };
    }
};
