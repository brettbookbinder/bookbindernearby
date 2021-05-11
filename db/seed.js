const client = require('./index')
async function createTables() {
    try {
        await client.connect()
        const response = await client.query(
            `
            CREATE TABLE places(
                id SERIAL PRIMARY KEY,
                name varchar(255) UNIQUE,
                address text
            );
            CREATE TABLE reviews(
                id SERIAL PRIMARY KEY,
                "placeid" INTEGER,
                FOREIGN KEY ("placeid") REFERENCES places (id), 
                review text
            );
            `
        )
    } catch (error) {
        console.log(error)
    }
}
createTables().then(function(){
    console.log("success!")
})