const express = require('express');
const app = express();

const PORT = 3000;

app.get('/api/',(req,res)=>{
    res.json({message:"THis msg from backend"});
})
app.listen(PORT,()=>{
    console.log("server successfully executed !!!");
    console.log(`server running on port ${PORT}`)
})
