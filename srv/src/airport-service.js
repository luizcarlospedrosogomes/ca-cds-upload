const cds = require("@sap/cds");
const { PassThrough } = require('stream');

module.exports = cds.service.impl(async (service) => {
	const db = await cds.connect.to("db");  
  const { Airports } = service.entities;

  service.on("CREATE", Airports, async (context) => {
    const tx =  db.tx(context);
    await tx.run(INSERT.into(Airports).entries(context.data));
  })

  service.on('CREATE', 'AirplanesUpload', (req) => {
    
    const stream = new PassThrough()
    const chunks = []
    const obj = {}
    stream.on('data', chunk => {
      chunks.push(chunk)
    })
    stream.on('end', () => {
      obj['media'] = Buffer.concat(chunks).toString('base64');
    })
    console.log(obj)
    req.data.content.pipe(stream)
  })
})