/**
 * http://usejsdoc.org/
 */

var http=require("http");

http.createServer(function (request, response){
	
	var data = fs.readFileSync('./test.txt', 'utf8');
	console.log(data);
	
	response.writeHead(200, {'Content-Type':'text/plain'});
	
	response.end(data);
	
}).listen(8888);

console.log('server running at http://127.0.0.1:8888');