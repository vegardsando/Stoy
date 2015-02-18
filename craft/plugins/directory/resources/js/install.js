(function($) {

    DirectoryInstall = Garnish.Base.extend(
    {
        $graphic: null,
        $status: null,
        $errorDetails: null,
        data: null,

        init: function(handle)
        {
            this.$graphic = $('#graphic');
            this.$status = $('#status');

            if (!handle)
            {
                this.showError(Craft.t('Unable to determine which plugin to install.'));
                return;
            }

            this.$handle = handle;

            this.data = {
                handle: handle
            };

            // let's get started
            this.postActionRequest('directory/install/prepare');
        },

        updateStatus: function(msg)
        {
            this.$status.html(msg);
        },

        showError: function(msg)
        {
            this.updateStatus(msg);
            this.$graphic.addClass('error');
        },

        postActionRequest: function(action)
        {
            var data = {
                data: this.data
            };

            Craft.postActionRequest(action, data, $.proxy(function(response, textStatus, jqXHR)
            {
                console.log(textStatus, response);
                if (textStatus == 'success' && response.alive)
                {
                    this.onSuccessResponse(response);
                }
                else
                {
                    this.onErrorResponse(jqXHR);
                }

            }, this), {
                complete: $.noop
            });

        },

        onSuccessResponse: function(response)
        {
            if (response.data)
            {
                this.data = response.data;
            }

            if (response.errorDetails)
            {
                this.$errorDetails = response.errorDetails;
            }

            if (response.nextStatus)
            {
                this.updateStatus(response.nextStatus);
            }

            if (response.nextAction)
            {
                this.postActionRequest(response.nextAction);
            }

            if (response.finished)
            {
                this.onFinish(response.returnUrl);
            }
        },

        onErrorResponse: function(jqXHR)
        {
            this.$graphic.addClass('error');
            var errorText = Craft.t('An error has occurred.') + '<br /><p>' + jqXHR.statusText + '</p><br /><p>' + jqXHR.responseText + '</p>';

            this.updateStatus(errorText);
        },

        onFinish: function(returnUrl)
        {
            if (this.$errorDetails)
            {
                this.$graphic.addClass('error');
                var errorText = Craft.t('Directory was unable to install this plugin :(') + '<br /><p>';

                errorText += Craft.t('No files have been updated and the database has not been touched.') + '</p><br /><p>';

                errorText += this.$errorDetails + '</p>';
                this.updateStatus(errorText);
            }
            else
            {
                this.updateStatus(Craft.t('Plugin Installed!'));
                this.$graphic.addClass('success');

                setTimeout($.proxy(function() {

                    $('<form method="post">'+
                        '<input type="hidden" name="redirect" value="directory" />'+
                        '<input type="hidden" name="action" value="plugins/installPlugin" />'+
                        '<input type="hidden" name="pluginClass" value="'+this.$handle+'" />'+
                    '</form>').appendTo('body').submit();

                }, this), 500);
            }
        }
    });

})(jQuery);
