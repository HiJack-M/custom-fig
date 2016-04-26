const gaze = require('gaze')
const Client = require('ssh2-sftp-client')

gaze('**/*.html', function(err, watcher) {
  const watched = this.watched()

  this.on('changed', function(localPath) {
    console.log(`Local >>>>>> ${localPath} <<<<<<`)
    const remotePath = getRemotePath(localPath)
    console.log(`Remote >>>>>> ${remotePath} <<<<<<`)

    // put file to remote service conform to sftp protocol
    put(localPath, remotePath)
  });
})

getRemotePath = (localPath) => {
  const prefixCount = 6
  const arr = localPath.split('/')
  for (let i = 0; i < prefixCount; i++) {
    arr.shift()
  }
  const suffixPath = arr.join('/')
  return `/www/web/${suffixPath}`
}

const put = (localPath, remotePath) => {
  const sftp = new Client()
  sftp.connect({
    host: '10.0.201.210',
    port: '932',
    username: 'apache',
    password: 'test',
  }).then(() => {
    // return sftp.list('/www/web/')
    return sftp.put(localPath, remotePath);
  }).then((data) => {
    // console.log(data)
    console.log(`>>>>>> Upload finished <<<<<<\n`)
  }).catch((err) => {
    console.log(err, 'catch err.')
  })
}
