// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquer"


// Replace 'url' with the hardcoded URL
$('#create-bracket').click(function () {
    $.ajax({
        url: '/brackets', // Replace with the actual path
        method: 'POST', // or 'GET' or other HTTP methods
        dataType: 'json', // Specify that you expect JSON data
        success: function (data) {
            // Handle the JSON data returned by the server (data)
            console.log(data); // You can log it or process it further
            $('#bracket-container').html(JSON.stringify(data));
        },
        error: function (xhr, status, error) {
            // Handle any errors here
            console.error(error);
        }

    });
});
