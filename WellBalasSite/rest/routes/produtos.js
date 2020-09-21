const express = require('express');
const router = express.Router();

// RETORNA TODOS OS PRODUTOS
router.get('/', (req, res, next) => {
    res.status(200).send({
        mensagem: 'Usando Get dentro da rota produto'
    })
});


//INSERE UM PRODUTO
router.post('/', (req, res, next) => {
    res.status(201).send({
        mensagem: 'Usando GET dentro da rota produto'
    })
});


// RETORNA OS DADOS DE UM PRODUTO
router.get('/:id_produto', (req, res, next) => {
    const id = req.params.id_produto;

    if(id === 'especial'){
        res.status(200).send({
            mensagem: 'Voce descobriu um id especial',
            id: id
        });
    } else {
        res.status(200).send({
            mensagem: 'Voce passou um id'
        })
    }  
});


// ALTERA UM PRODUTO
router.patch('/', (req, res, next) => {
    res.status(201).send({
        mensagem: 'Usando PATCH dentro da rota produto'
    })
});


// DELETA UM PRODUTO
router.delete('/', (req, res, next) => {
    res.status(201).send({
        mensagem: 'Usando DELETE dentro da rota produto'
    })
});



module.exports = router;