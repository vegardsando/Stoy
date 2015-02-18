var $plugins;

$(function() {

    // search plugins

    $plugins = ko.observableArray();
    $popularPlugins = ko.observableArray();

    $('#directory-search').submit(function() {
        q = this.elements["q"].value;

        if(q.length > 0)
        {
            data = {
                q: q
            };

            $('#directory-search .spinner').removeClass('hidden');

            Craft.postActionRequest('directory/searchPlugins', data, $.proxy(function(response) {
                if(typeof(response.error) != 'undefined')
                {
                    $('#directory-search .error').html(response.error);
                    $('#directory-search .error').removeClass('hidden');
                }
                else
                {
                    responsePlugins = response.plugins;
                    responsePlugins = convertToObservable(responsePlugins);
                    $plugins(responsePlugins);
                }

                $('#directory-search .spinner').addClass('hidden');
            }, this));
        }

        return false;
    });


    // popular plugins

    $('.directory-popular .spinner').removeClass('hidden');

    Craft.postActionRequest('directory/getPopularPlugins', {}, $.proxy(function(response) {
        if(typeof(response.error) != 'undefined')
        {
            $('.directory-popular .error').html(response.error);
            $('.directory-popular .error').removeClass('hidden');
        }
        else
        {
            responsePlugins = response.plugins;
            responsePlugins = convertToObservable(responsePlugins);
            $popularPlugins(responsePlugins);
        }

        $('.directory-popular .spinner').addClass('hidden');
    }, this));

    var viewModel = {
        query: ko.observable(''),
        plugins: $plugins,
        popularPlugins:$popularPlugins
    };

    ko.applyBindings(viewModel);
});

function convertToObservable(list)
{
    var newList = [];
    $.each(list, function (i, obj) {
        var newObj = {};
        Object.keys(obj).forEach(function (key) {
            newObj[key] = ko.observable(obj[key]);
        });
        newList.push(newObj);
    });
    return newList;
}




// viewModel.plugins = ko.computed(function() {

//     var search = this.query().toLowerCase();

//     return ko.utils.arrayFilter($plugins(), function(plugin) {

//         matchName = plugin.name().toLowerCase().indexOf(search) >= 0;
//         matchDeveloper = plugin.developer().toLowerCase().indexOf(search) >= 0;
//         matchDescription = plugin.description().toLowerCase().indexOf(search) >= 0;

//         if(matchName || matchDeveloper ||  matchDescription)
//         {
//             return true;
//         }

//         return false;
//     });
// }, viewModel);