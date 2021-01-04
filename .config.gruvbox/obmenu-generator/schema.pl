#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
	{sep => 'Gyorsindító'},
    #          COMMAND                 LABEL              ICON
    {item => ['thunar',       'Fájlkezelő', 'system-file-manager']},
    {item => ['termite',            'Terminál',     'utilities-terminal']},
    {item => ['firefox', 'Webböngésző',  'web-browser']},
    {item => ['gmrun',            'Futtatás...',  'system-run']},

    {sep => 'Kategóriák'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Kellékek', 'applications-utilities']},
    {cat => ['development', 'Fejlesztőeszközök', 'applications-development']},
    {cat => ['education',   'Tanulás',   'applications-science']},
    {cat => ['game',        'Játékok',       'applications-games']},
    {cat => ['graphics',    'Grafika',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimédia',  'applications-multimedia']},
    {cat => ['network',     'Hálózat',     'applications-internet']},
    {cat => ['office',      'Irodai alkalmazások',      'applications-office']},
    {cat => ['other',       'Egyéb...',       'applications-other']},
    {cat => ['settings',    'Beállítások',    'applications-accessories']},
    {cat => ['system',      'Rendszer',      'applications-system']},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {beg => ['További beállítások', 'applications-engineering']},

      # Configuration files
      {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-generic']},
      {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-generic']},

      # obmenu-generator category
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menü Séma', 'text-x-generic']},
        {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menü Beállítófájl', 'text-x-generic']},

        {sep  => undef},
        {item => ['obmenu-generator -s -c',    'Statikus menü generálása',             'accessories-text-editor']},
        {item => ['obmenu-generator -s -i -c', 'Statikus menü generálása ikonokkal',  'accessories-text-editor']},
        {sep  => undef},
        {item => ['obmenu-generator -p',       'Dinamikus menü generálása',            'accessories-text-editor']},
        {item => ['obmenu-generator -p -i',    'Dinamikus menü generálása ikonokkal', 'accessories-text-editor']},
        {sep  => undef},

        {item => ['obmenu-generator -d', 'Gyorsítótár újratöltése', 'view-refresh']},
      {end => undef},

      # Openbox category
      {beg => ['Openbox', 'openbox']},
        {item => ["$editor ~/.config/openbox/autostart", 'Openbox Indítópult',   'text-x-generic']},
        {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menü',        'text-x-generic']},
        {item => ['openbox --reconfigure',               'Openbox konfiguráció újratöltése', 'openbox']},
      {end => undef},
    {end => undef},

    {sep => 'Kilépés'},

    ## The xscreensaver lock command
    {item => ['sh /home/manjarousr/i3lock.sh', 'Zálolás', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
    {exit => ['Kilépés', 'application-exit']},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'application-exit']},
]
