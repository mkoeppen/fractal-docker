'use strict';

const faker = require('faker');

module.exports = {
    title: "Knopf",
    collated: true,
    context: {
        content: faker.name.findName()
    },
    variants: [
        {
            name: "with-icon",
            context: {
                icon: "fa fa-arrow-left",
                content: faker.name.findName()
            }
        }
    ]
}