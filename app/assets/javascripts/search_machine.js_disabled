document.addEventListener("turbolinks:load", function() {
$input = $("[data-behavior='autocomplete']")
  var options = {

        url: "/allmachine.json",

    categories: [{
        listLocation: "machine",
        header: "Choose Machine:"
    }],

    getValue: function(element) {
        return element.name;
    },

    // template: {
    //     type: "description",
    //     fields: {
    //         description: "description"
    //     }
    // },

    list: {
        maxNumberOfElements: 8,
        match: {
            enabled: true
        },
        sort: {
            enabled: true
        },
    
        showAnimation: {

            type: "normal", //normal|slide|fade
            time: 200,
            callback: function() {}
        },

        hideAnimation: {

            type: "normal", //normal|slide|fade
            time: 200,
            callback: function() {}
        }
},

    theme: "plate-dark"
};

$input.easyAutocomplete(options);

});