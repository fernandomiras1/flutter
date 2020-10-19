const { io } = require('../index');
const Band = require('../models/band');
const Bands = require('../models/bands');

const bands = new Bands();
bands.addBand(new Band('Queen'));
bands.addBand(new Band('Metalica'));
bands.addBand(new Band('Electronica'));
bands.addBand(new Band('Lucero'));
bands.addBand(new Band('Eminem'));


// Mensajes de Sockets
io.on('connection', client => {
    console.log('Cliente conectado');
    // le mando todo el listado de bandas a los clientes conectados.
    io.emit('active-bands', bands.getBands());

    client.on('disconnect', () => {
        console.log('Cliente desconectado');
    });

    client.on('mensaje', ( payload ) => {
        console.log('Mensaje', payload);

        io.emit( 'mensaje', { admin: 'Nuevo mensaje' } );

    });
  
    client.on('vote-band', ( payload ) => {
        bands.voteBand(payload.id);
        io.emit('active-bands', bands.getBands());
    });

    client.on('delete-band', ( payload ) => {
        bands.deleteBand(payload.id);
        io.emit('active-bands', bands.getBands());
    });

    client.on('add-band', ( payload ) => {
        const newBand = new Band(payload.name);
        bands.addBand(newBand);
        io.emit('active-bands', bands.getBands());
    });

});
