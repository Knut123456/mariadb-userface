const mariadb = require('mariadb');
let hostEL = document.getElementById('host');
let userEL = document.getElementById('user');
let passwordEL = document.getElementById('password');
async function connectToDatabase(host, user, password) {
    // Create a connection pool
    const pool = mariadb.createPool({
        host: 'localhost', // Database host
        user: 'yourUsername', // Database username
        password: 'yourPassword', // Database password
    });

   
    let conn;
    try {
        conn = await pool.getConnection();
        console.log("Connected to the database!");

        // Example query
        const rows = await conn.query("SELECT 1 as val");
        console.log(rows); // Output: [ {val: 1}, meta: ... ]

    } catch (err) {
        console.error("Error connecting to the database:", err);
    } finally {
        if (conn) conn.release(); // Release the connection back to the pool
    }
    
    }
    // Call the function to connect
        connectToDatabase();
