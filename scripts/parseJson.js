process.stdin.on('data', data => {
    try {
        const obj = JSON.parse(data);
        switch (process.argv[2]) {
            case '--latest':
                console.log(obj.versions.pop())
                return;
            case '--build':
                console.log(obj.builds.pop())
                return;
            default:
                console.error('Invalid command' + process.argv[2]);
                break;
        }
    } catch (e) {
        console.error('Invalid JSON:', e.message);
    }
});




