const { readFileSync } = require('fs')

const f = process.argv.pop()
console.log('checking file', f)
readFileSync(f).toString()
    .split('\n')
    .forEach(line => {
	console.log(line)
	
    })

