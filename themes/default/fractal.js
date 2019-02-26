'use strict';

/*
* Require the path module
*/
const path = require('path');

/*
 * Require the Fractal module
 */
const fractal = module.exports = require('@frctl/fractal').create();

/*
 * Give your project a title.
 */
fractal.set('project.title', 'Unitb Frontend');

/*
 * Tell Fractal where to look for components.
 */
fractal.components.set('path', path.join(__dirname, 'components'));

/*
 * Tell Fractal where to look for documentation pages.
 */
fractal.docs.set('path', path.join(__dirname, 'docs'));

/*
 * Tell the Fractal web preview plugin where to look for static assets.
 */
fractal.web.set('static.path', path.join(__dirname, 'public'));


// fractal.components.set('default.collator', function(markup, item) {
//     return `<!-- Start: @${item.handle} -->\n<fieldset><legend>@${item.handle}</legend>${markup}</fieldset>\n<!-- End: @${item.handle} -->\n`
// });


/*
 * Require the Twig adapter
 */
const twigAdapter = require('@frctl/twig')({
    // if pristine is set to true, bundled filters, functions, tests
    // and tags are not registered.
    // default is false
    pristine: false,

    // if importContext is set to true, all include calls are passed
    // the component's context
    // default is false
    importContext: false,

    // use custom handle prefix
    // this will change your includes to {% include '%button' %}
    // default is '@'
    handlePrefix: '@',

    // register custom filters
    filters: {
        // usage: {{ label|capitalize }}
        capitalize: function(str) {
            if (!str) return '';

            return str.charAt(0).toUpperCase() + str.slice(1);
        }
    },

    // register custom functions
    functions: {
        // usage: {{ capitalize(label) }}
        capitalize: function(str) {
            if (!str) return '';

            return str.charAt(0).toUpperCase() + str.slice(1);
        }
    },

    // register custom tests
    tests: {
        // usage: {% if label is equalToNull %}
        equalToNull: function(param) {
            return param === null;
        }
    },

    // register custom tags
    tags: {
        flag: function(Twig) {
            // usage: {% flag "ajax" %}
            // all credit to https://github.com/twigjs/twig.js/wiki/Extending-twig.js-With-Custom-Tags
            return {
                // unique name for tag type
                type: "flag",
                // regex match for tag (flag white-space anything)
                regex: /^flag\s+(.+)$/,
                // this is a standalone tag and doesn't require a following tag
                next: [ ],
                open: true,

                // runs on matched tokens when the template is loaded. (once per template)
                compile: function (token) {
                    var expression = token.match[1];

                    // Compile the expression. (turns the string into tokens)
                    token.stack = Twig.expression.compile.apply(this, [{
                        type:  Twig.expression.type.expression,
                        value: expression
                    }]).stack;

                    delete token.match;
                    return token;
                },

                // Runs when the template is rendered
                parse: function (token, context, chain) {
                    // parse the tokens into a value with the render context
                    var name = Twig.expression.parse.apply(this, [token.stack, context]),
                        output = '';

                    flags[name] = true;

                    return {
                        chain: false,
                        output: output
                    };
                }
            };
        }
    }
});

fractal.components.engine(twigAdapter);
fractal.components.set('ext', '.twig');