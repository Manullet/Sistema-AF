//Importar el paquete de MYSQL
import { createPool } from "mysql2/promise";

//Conectar a la base de datos (mysql)
export const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bd_af',
    multipleStatements: true
})