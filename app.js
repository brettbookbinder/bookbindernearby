const client = require('./db/index.js')
const express = require('express')
const server = express()
const port = process.env.PORT || 3001
const cors = require('cors')

server.use(cors())
server.use(express.json())

server.get('/', (req, res) => {
  res.send('Hello World!')
})

server.get('/places', async (req, res) => {
  try {
    const response = await client.query(
      `
      SELECT json_build_object('id', places.id, 'name', places.name, 'address', places.address, 'reviews',
      (SELECT json_agg(json_build_object('id', reviews.id, 'review', reviews.review))
      FROM reviews WHERE places.id = reviews."placeid"))
      FROM places;
      `
    )
    console.log(response.rows)
    const updatedRows = response.rows.map(function (outerObject) {
      if (outerObject.json_build_object.reviews === null) {
        return { ...outerObject.json_build_object, reviews: [] }
      }
      else {
        return { ...outerObject.json_build_object }
      }
    })
    console.log(updatedRows)
    res.send(updatedRows)
  } catch (error) {
    res.sendStatus(500)
    console.log(error)
  }
})

server.post('/review/:placeName', async (req, res) => {
  const placeName = req.params.placeName
  const review = req.body.review
  try {
    const response = await client.query(
      `
      SELECT * FROM places WHERE name = $1;
      `, [placeName]
    )
    const placeid = response.rows[0].id
    const response2 = await client.query(
      `
      INSERT INTO reviews (review, "placeid")
      VALUES ($1, $2)
      returning *;
      `, [review, placeid]
    )
    res.send(response2.rows[0])
  } catch (error) {
    res.sendStatus(500)
    console.log(error)
  }
})

server.get('/search/:placeName/:location', async (req, res) => {
  const placeName = '%' + req.params.placeName + '%'
  const location = '%' + req.params.location + '%'
  try {
    const response2 = await client.query(
      `
      SELECT json_build_object('id', places.id, 'name', places.name, 'address', places.address, 'reviews',
      (SELECT json_agg(json_build_object('id', reviews.id, 'review', reviews.review))
      FROM reviews WHERE places.id = reviews."placeid"))
      FROM places WHERE places.name like $1 or places.address like $2;
      `, [placeName, location]
    )
    const updatedRows = response2.rows.map(function (outerObject) {
      if (outerObject.json_build_object.reviews === null) {
        return { ...outerObject.json_build_object, reviews: [] }
      }
      else {
        return { ...outerObject.json_build_object }
      }
    })
    res.send(updatedRows)
  } catch (error) {
    res.sendStatus(500)
    console.log(error)
  }
})

server.post('/place', async (req, res) => {
  const name = req.body.name;
  const address = req.body.address;

  try {
    const response = await client.query(
      `
      INSERT INTO places (name, address)
      VALUES($1,$2)
      RETURNING *;
      `, [name, address]
    )
    console.log(response.rows)
    res.send(response.rows[0])
  } catch (error) {
    res.sendStatus(500)
    console.log(error)
  }
})

server.listen(port, async () => {
  console.log(`Example app listening at http://localhost:${port}`)
  await client.connect()
})