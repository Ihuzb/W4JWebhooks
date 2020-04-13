const http = require('http');
const spawn = require('child_process').spawm;
const createHandler = require('github-webhook-handler');
const handler = createHandler({
    path: '/home/ihuzb/runConfig',
    secret: 'hzb136877'
});
http.createServer((req, res) => {
    handler(req, res, (err) => {
        res.statusCode = 404;
        res.end('no such location')
    })
}).listen(4130);
handler.on('error', (err) => {
    console.error('Error:', err.message)
})
handler.on('push', async (event) => {
    console.log('Received a push event for %s to %s',
        event.payload.repository.name,
        event.payload.ref);
    let txt = await rumCommand('sh', ['./deployed.sh',event.payload.repository.name]);
    console.log(txt)
})
rumCommand = (cmd, args) => {
    return new Promise((resolve, reject) => {
        let child = spawn(cmd, args);
        let response = ''
        child.stdout.on('data', function (buffer) {
            response += buffer.toString()
        })
        child.stdout.on('end', function () {
            resolve(response)
        })
    })
}