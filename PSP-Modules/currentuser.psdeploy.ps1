Deploy CurrentUser {
    By Filesystem {
        FromSource '<%= $PLASTER_PARAM_ModuleName %>'
        To "$home\Documents\WindowsPowerShell\Modules\<%= $PLASTER_PARAM_ModuleName %>"
        WithOptions @{
            Mirror = $true
        }
    }
}