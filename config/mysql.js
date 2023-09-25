const mysql = require ('mysql')
const connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'bd_af'
})

connection.connect((err)=>{

    if(err) throw err
    console.log('conexion perro en la base ')

})

connection.query('SELECT * FROM tbl_roles', (err, rows)=> {

    if(err) throw err
    console.log('los datos son:')
    console.log(rows)
    


})



connection.end();