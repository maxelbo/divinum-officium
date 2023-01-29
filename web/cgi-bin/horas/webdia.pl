#!/usr/bin/perl
use utf8;

# Name : Laszlo Kiss
# Date : 01-11-04
# WEB dialogs
#use warnings;
#use strict "refs";
#use strict "subs";
my $a = 4;

#*** htmlHead($title, $flag)
# generated the standard head with $title
sub htmlHead {
  my $title = shift;
  my $flag = shift;
  if (!$title) { $title = ' '; }

  #  print "Content-type: text/html; charset=ISO-8859-1\n\n";
  print "Content-type: text/html; charset=utf-8\n\n";
  print << "PrintTag";
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="resource-type" content="document">
    <meta name="description" content="Divine Office">
    <meta name ="keywords" content="Divine Office, Breviarium, Liturgy, Traditional, Zsolozsma">
    <meta name="copyright" content="Like GNU">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>$title</title>
    <link rel="stylesheet" href="../../www/style/global.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght\@0,500;0,700;1,500;1,700&display=swap" rel="stylesheet">
    <style>
      
      /* https://www.30secondsofcode.org/css/s/offscreen/ */
      .offscreen {
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
      }

      h1, h2 {
        text-align: center;
        font-weight: normal;
      }

      h2 {
        margin-top: 4ex;
        color: var(--maroon);
        font-size: 112%;
        font-weight: bold;
        font-style: italic;
      }

      .header-day {
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        margin: 1rem auto;
        padding: 0 0 1rem;
        gap: 0.3rem;
        border-bottom: 1px solid #333;
      }

      .header-day h3 {
        font-size: 1rem;
        margin: 0 auto 0.5rem;
      }

      .main-title {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 0.3rem;
      }

      .main-title h1 {
        color: var(--maroon);
        font-weight: bold; 
         text-transform: uppercase;
        margin: 0;
      }

      .main-title h2 {
        color: var(--red);
        font-weight: 500;
        font-style: normal;
        margin: 0;
      }

      .date {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        margin: 1rem auto;
      }

      .date a {
        text-decoration: none;
        font-size: 1.8rem;
      }

      #date {
        height: 1.5rem;
        text-align: center;
      }

      .date-button {
        width: 1.5rem;
        height: 1.5rem;
        color: var(--red);
        line-height: 1.2rem;
        background-color: var(--background);
        border-radius: 0.2rem;
      }

      .date-button:hover {
        opacity: 0.8;
      }

      .date-button:focus {
        border-style: inset;
      }

      .main-menu-pc {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        margin: 2rem auto 3rem;
      }

      .main-menu-pc div {
        display: flex;
        gap: 1rem;
      }

      .main-menu-pc h3 {
        color: var(--maroon);
        font-style: italic;
        margin: 0;
      }

      .main-menu-pc .date {
        display: flex;
        gap: 1rem;
        justify-content: center;
        align-items: center;
        margin: 0.2rem 0;
      }

      .numsel {
        display: flex;
        justify-content: center;
        margin: -0.5rem auto 1rem;
      }

      .horas-menu {
        display: flex;
        flex-flow: wrap;
        flex-wrap: wrap;
        justify-content: center;
        gap: 0.3rem 1rem;
        margin: 1rem auto;
        padding: 0 5rem;
        font-style: italic;
        text-align: center;
      }

      .break {
        flex-basis: 100%;
        height: 0;
        margin: 0;
        padding: 0;
        border: 0;
      }

      .pmenu {
        display: flex;
        flex-direction: row;
        justify-content: center;
        gap: 1rem;
        margin: 2rem auto 0;
      }

      .main-table {
        font-size: large; 
        margin: 2rem auto;
        text-align: center;
      }

      .main-table td {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 0.3rem;
      }

      td {
        padding: 1rem;
      }

      .image-table-sp {
        display: flex;
        justify-content: center;
        margin: 1rem auto 2rem;
      }

      .image-table-pc {
        margin: 0 auto 3rem;
      }

      .image-table-pc td {
        text-align: center;
        color: var(--maroon);
        padding: 0;
      }

      .missa-image {
        display: flex; 
        justify-content: center; 
        width: 100%; 
        max-width: 400px; 
        padding: 0 1rem; 
        margin: 1rem auto 2rem;
      }

      .kalendar-table {
        margin: 1rem auto 3rem;
        width: 100%;
        table-layout: fixed;
      }

      .kalendar-table th:first-child,
      .kalendar-table th:last-child {
        width: 50px;
      }

      .kalendar-table td {
        overflow: hidden;
        text-overflow: ellipsis;
        word-wrap: break-word;
      }

      .kalendar-table td:first-child,
      .kalendar-table td:last-child {
        text-align: center;
        width: 26px;
        padding: 0;
      }

      .selectables {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 1rem;
        margin: 1rem 4rem 2rem;
        text-align: center;
      }

      \@media (min-width: 750px) {
        
        .main-menu-pc {
          flex-direction: row;
          gap: 1rem;
          margin: 2rem auto 1rem;
          width: 550px;
          margin: 1rem auto 2rem
        }

        .main-menu-pc .date {
          gap: 0.5rem;
        }
        
        .selectables {
          display: flex;
          flex-direction: row;
          justify-content: center;
          gap: 1rem;
        }
      }
    </style>
PrintTag
  if ($flag == 2) { horasjs(); }
  print "</head>";
}

#*** htmlInput()
# generates html inputs as input, select, checkbox
# parmode = Label | Entry~>'width' | Text~>'rows'x'columns' |
#        Checkbutton  | Radiobutton~>'itemlist' | Optionmenu~>itemarray |
#        Listbox~>'itemlist' | Scale~>'from'~'to' | Filesel~>stock |
#        Color | Font | Pixel |Position | Points | Area | Ngon
#    itemlist is a comma separated list e.g "Radiobutton~>add,sub,both"
#    itemarray is either ~>Optionmenu~>\@oarray @oarray defined by the caller program,
#       or ~>Optionmenu~>oarray and defined by  [oarray] comma separated list entry in .setup file
#       or ~>Optionmenu~>{item1, item2, ...} list
#    stock option results a possibility to select the item from the stocked images
# condition is useable if the first item is Optionselect. The item is shown only
#   if condition string contains the selected item

sub htmlInput {
  my($parname, $parvalue, $parmode, $parpar, $parfunc, $parhelp) = @_;
  my $output = '';

  if ($parmode =~ /^label/i) {
    my $ilabel = $parvalue;
    if ($parpar) { $ilabel = wrap($ilabel, $parpar, "<br/>\n"); }
    $output .= "$ilabel";
    $output .= "<input type=hidden name=\'$parname\' value=\'$parvalue\'>\n";
  } elsif ($parmode =~ /entry/i) {
    $width = $parpar;
    if (!$width || $width == 0) { $width = 3; }
    my $jsfunc = '';
    if ($parfunc) { $jsfunc = "onchange=\"$parfunc;\""; }
    $output .= "<input type=text NAME=\'$parname\' id=\'$parname\' $jsfunc size=$width value=\'$parvalue\'>\n";
  } elsif ($parmode =~ /^text/i) {
    my @size = split('x', $parpar);
    if (@size < 2) { @size = (3, 12); }
    my $pv = $parvalue;
    $pv =~ s/  /\n/g;
    my $loadfile = strictparam('loadfile');

    if ($loadfile) {
      $loadfile =~ s/\.gen//;

      if (@cm = do_read("$datafolder/gen/$loadfile.gen")) {
        $pv = join('', @cm);
      }
    }
    my $savefile = strictparam('savefile');

    if ($savefile) {
      $savefile =~ s/\.gen//;
      do_write("$datafolder/gen/$savefile.gen", $pv);
    }
    $output .= "<TEXTAREA NAME=\'$parname\' ID=\'$parname\' COLS=$size[1] ROWS=$size[0]>$pv</TEXTAREA><BR>\n";
    $output .= "<A HREF='#' onclick='loadrut();'>";
    $output .= setfont($dialogfont) . "Load</FONT></A>";
  } elsif ($parmode =~ /checkbutton/i) {
    my $checked = ($parvalue) ? 'CHECKED' : '';
    my $jsfunc = '';
    if ($parfunc) { $jsfunc = "onclick=\"$parfunc;\""; }
    $output .= "<INPUT TYPE=CHECKBOX NAME=\'$parname\' ID=\'$parname\' $checked $jsfunc>\n";
  } elsif ($parmode =~ /^radio/i) {
    if ($parmode =~ /vert/i) { $output .= "<TABLE>"; }
    $rpar = $parpar;
    @rpar = split(',', $rpar);

    for ($j = 1; $j <= @rpar; $j++) {
      my $checked = ($parvalue == $j) ? 'CHECKED' : '';
      if ($parmode =~ /vert/i) { $output .= "<TR><TD>"; }
      my $jsfunc = '';
      if ($parfunc) { $jsfunc = "onclick=\"$parfunc;\""; }
      $output .= "<INPUT TYPE=RADIO NAME=\'$parname\' ID=\'$parname\' VALUE=$j $checked $jsfunc>";
      $output .= "<FONT SIZE=-1> $rpar[$j-1] </FONT>\n";
      if ($parmode =~ /vert/i) { $output .= "</TD></TR>"; }
    }
    if ($parmode =~ /vert/i) { $output .= "</TABLE>"; }
  } elsif ($parmode =~ /^updown/i) {
    if (!$parvalue && $parvalue != 0) { $parvalue = 5; }
    $output .= "<IMG SRC=\"$htmlurl/down.gif\" ALT=down ALIGN=TOP onclick=\"$parfunc($parpos,-1)\">\n";
    $output .= "<INPUT TYPE=TEXT NAME=\'$parname\' ID=\'$parname\' SIZE=$parpar "
      . "VALUE=$parvalue onchange=\"$parfunc($parpos,0);\">\n";
    $output .= "<IMG SRC=\"$htmlurl/up.gif\" ALT=up ALIGN=TOP onclick=\"$parfunc($parpos,1);\">\n";
  } elsif ($parmode =~ /^scale/i) {
    $output .= "<INPUT TYPE=TEXT SIZE=6 NAME=\'$parname\' ID=\'$parname\' VALUE=$parvalue>\n";
  } elsif ($parmode =~ /filesel/i) {    #type=file value is read only
    if ($parpar =~ /stack/i) {
      $output .= "<INPUT TYPE=RADIO NAME='mousesel' VALUE='stack'" . " onclick=\'mouserut(\"stack$parpos\");\'>\n";
    }
    $output .= "<INPUT TYPE=TEXT SIZE=16 NAME=\'$parname\' ID=\'$parname\'" . " VALUE=\'$parvalue\'>\n";

    if ($parpar !~ /stackonly/i) {
      $output .= "<INPUT TYPE=BUTTON VALUE=' ' onclick='filesel(\"$parname\", \"$parpar\");'>\n";
    }
  } elsif ($parmode =~ /color/i) {
    my $size = 3;
    if ($parpar) { $size = $parpar; }
    $output .= "<INPUT TYPE=RADIO NAME='mousesel' VALUE='color'" . " onclick=\'mouserut(\"color$parpos\");\'>\n";
    $output .= "<INPUT TYPE=TEXT SIZE=8 NAME=\'$parname\' ID=\'$parname\'" . " VALUE=\'$parvalue\'>\n";
    $output .= "<INPUT TYPE=BUTTON VALUE=' ' onclick='colorsel(\"$parname\",$size);'>\n";
  } elsif ($parmode =~ /font/i) {
    my $size = 16;
    if ($parpar) { $size = $parpar }
    $output .= "<INPUT TYPE=TEXT SIZE=$size NAME=\'$parname\' ID=\'$parname\'" . " VALUE=\'$parvalue\'>\n";
    $output .= "<INPUT TYPE=BUTTON VALUE=' ' " . "onclick='fontsel(\"$parname\");'>\n";
  } elsif ($parmode =~ /^option/i) {
    my $a = $parpar;
    if (!$a) { $error = "Missing parameter for Optionmenu"; return ""; }

    if ($a =~ /\@/ || ref($a) =~ /ARRAY/i) {
      @optarray = eval($a);
    } elsif ($a =~ /^\s*\{(.+)\}\s*$/) {
      @optarray = split(',', $1);
    } else {
      @optarray = getdialog($a);
    }
    my $onclick =
        ($parmode =~ /select/i) ? "onchange=\'buttonclick(\"$command\");\'"
      : ($parfunc) ? qq(onchange="$parfunc;")
      : '';
    my $osize = @optarray;
    chomp($optarray[-1]);
    $output .= "<SELECT ID=$parname NAME=$parname SIZE=$osize $onclick>\n";
    foreach(@optarray) {
      my($display, $value) = split(/\//);
      $value ||= $display;
      my $selected = $value eq $parvalue ? 'SELECTED' : '';
      $output .= "<OPTION $selected VALUE=\"$value\">$display\n";
    }
    $output .= "</SELECT>\n";
  }
  return $output;
}

#*** cleanse(s)
# Return tainted string s cleansed of dangerous characters.
sub cleanse($) {
  my $str = shift;

  unless ($str =~ /^\w*$/) {

    # Complex params are generally ;-separated chunks where
    # a chunk is either an identifier or a quoted string of assorted chars,
    # possibly preceded by an assignment $id= .
    @parts = split(/;/, $str);

    foreach my $part (@parts) {
      unless ($part =~ /^([^'`"\\={}()]*|'[^'`"\\]*'|\$\w+='[^'`"\\]*')$/i) {

        #print STDERR "erasing $part\n";
        $part = '';
      }
    }
    $str = join(';', @parts);
  }
  return $str;
}

#*** beep()
# generates a beep sound. Inactive in cgi version
sub beep {
}

#*** strictparam(name)
# get the parameter value for name, empty string if undef
sub strictparam {
  my $pstr = shift;
  my $v = cleanse($q->param($pstr));
  $v = '' unless defined $v;
  return $v;
}

#*** clean_setupsave($setupsave)
# Takes a settings string in the format stored in the cookies, and returns a
# cleaned version.
sub clean_setupsave {
  my $setupsave = shift;
  $setupsave =~ s/[‘’]|\x{e2}\x{80}(\x{98}|\x{99})/'/g;
  return $setupsave;
}

#*** setfont($font, $text)
# input font description is "[size][ italic][ bold] color" format, and the text
# returns <FONT ...>$text</FONT> string
sub setfont {
  my $istr = shift;
  my $text = shift;
  my $size = ($istr =~ /^\.*?([0-9\-\+]+)/i) ? $1 : 0;
  my $color = ($istr =~ /([a-z]+)\s*$/i) ? $1 : '';
  if ($istr =~ /(\#[0-9a-f]+)\s*$/i || $istr =~ /([a-z]+)\s*$/i) { $color = $1; }
  my $font = "<FONT ";
  if ($size) { $font .= "SIZE=$size "; }
  if ($color) { $font .= "COLOR=\"$color\""; }
  $font .= ">";
  if (!$text) { return $font; }
  my $bold = '';
  my $bolde = '';
  my $italic = '';
  my $italice = '';
  if ($istr =~ /bold/) { $bold = "<B>"; $bolde = "</B>"; }
  if ($istr =~ /italic/) { $italic = "<I>"; $italice = "</I>"; }
  return "$font$bold$italic$text$italice$bolde</FONT>";
}

# Fetch and cleanse cookies
sub fetch_cookies() {
  my %cookies = fetch CGI::Cookie;
  $_->value(cleanse($_->value)) for values %cookies;
  return %cookies;
}

#*** getcookies($cname, $setupname)
# get the cookie named as cname and sets the values into $setupname group
# separates the perl scripts from the stack array
# return the perl script string and the array reference
sub getcookies {

  my $cname = shift;
  my $name = shift;
  my @sti = splice(@sti, @sti);
  my $sti = '';
  my $checkname = $name . 'check';

  $check = getsetup($checkname);
  $check =~ s/\s//g;
  %cookies = fetch_cookies();

  foreach (keys %cookies) {
    my $c = $cookies{$_};
    if ($c->name =~ /$cname/) { $sti = $c->value; }
  }

  if ($sti) {
    @sti = split(';;;', $sti);
    my $param = getsetup($name);
    $param =~ s/\;\;\s*$//;
    my @param = split(';;', $param);

    #check if the structure of the parameters is the same
    if (@sti > @param + 1 || ($check !~ /^$sti[-1]/)) {
      $error = "Cookie $cname mismatch $name need $check has $param<br>== $sti[-1]";
      return 0;
    }
    setsetup($name, @sti);
    return 1;
  }
  return 0;
}

#*** setcookies($cname, $name)
#saves $name setup table as cookie named $cname
sub setcookies {

  my $cname = shift;
  my $name = shift;
  my @values = split(';;', getsetup($name));
  my $value = '';
  my $checkname = $name . 'check';

  $check = getsetup($checkname);
  $check =~ s/\s//g;

  if (!$values[-1]) {
    $values[-1] = $check;
  }

  foreach (@values) {
    my @a = split('=', $_);
    $value .= "$a[1]";
    while ($value !~ /\;\;\;$/) { $value .= ';' }
  }
  $value .= "$check;;;";
  $value =~ s/\r*\n/  /g;
  $c = $q->cookie(
    -name => "$cname",
    -value => "$value",
    -expires => "$cookieexpire"
  );

  if (length($c) < 4096) {
    print "Set-Cookie:$c\n";
  } else {
    $error .= 'Command/stack is longer than 4095 characters';
  }
  return "$c";
}

#cookie for recognize the new day
sub setcookie1 {
  my $cname = shift;
  my $value = shift;
  my @t = localtime(time() + 60 * 60 * 24);
  my $t = timelocal($t[0], $t[1], $t[2], $t[3], $t[4], $t[5]);
  $c = $q->cookie(
    -name => "$cname",
    -value => "$value",
    -expires => $t
  );
  print "Set-Cookie:$c\n";
}

sub getcookie1 {
  my $cname = shift;
  my $sti = 0;
  %cookies = fetch_cookies();

  foreach (keys %cookies) {
    my $c = $cookies{$_};
    if ($c->name =~ /$cname/) { $sti = $c->value; }
  }
  return $sti;
}

#*** setcross($line)
# changes +++, ++ + to crosses in the line
# +++ is "make a cross with finger and thumb on lips or heart"
# ++ is "make three crosses with thumb, on forehead, lips, and heart, at the Holy Gospel"
# + is "make a cross over the forehead and abdomen: cross yourself"
# This version uses Unicode entities instead of small GIFs.
sub setcross {
  my $line = shift;

  if ($nofancychars) { return $line; }

  my $csubst = '';

  if (CGI::user_agent("BlackBerry")) {
    # Not enough Unicode for what we really want, below.  Fake it.
    # cross type 3: COPTIC SMALL LETTER DEI
    $csubst = "<span style='color:var(--red); font-size:1.25em'>&#x03EF;</span>";
    $line =~ s/\+\+\+/$csubst/g;

    # Cross type 2: Latin Cross
    $csubst = "<span style='color:var(--red); font-size:1.25em'>&#x271D;&#xFE0E;</span>";
    $line =~ s/\+\+/$csubst/g;

    # Cross type 1: PLUS SIGN
    $csubst = "<span style='color:var(--red); font-size:1.25em'>+</span>";
    $line =~ s/ \+ / $csubst /g;
  } else {
    # Cross type 3: Outlined Greek Cross
    $csubst = "<span style='color:var(--red); font-size:1.25em'>&#x2719;&#xFE0E;</span>";
    $line =~ s/\+\+\+/$csubst/g;

    # Cross type 2: Greek Cross
    $csubst = "<span style='color:var(--red); font-size:1.25em'>+︎</span>";
    $line =~ s/\+\+/$csubst/g;

    # cross type 1: Maltese Cross
    $csubst = "<span style='color:var(--red); font-size:1.25em'>✠</span>";
    $line =~ s/ \+ / $csubst /g;
  }
  return $line;
}

#*** setvrbar($line)
# set R- & V-bar
sub setvrbar {
  my $line = shift;
  if ($nofancychars) { return $line; }
  $line =~ s/^V\./℣./g;
  $line =~ s/^R\./℟./g;
  return $line;
}

#*** setcell($text1, $lang1);
# output the content of the cell
sub setcell {
  my $text = shift;
  my $lang = shift;
  my $width = ($only) ? 100 : 50;

  if (!$Ck) {
    if (columnsel($lang)) {
      $searchind++ if ($text !~ /{omittitur}/);
      print "<TR>";

      if ($notes && $text =~ /\{\:(.*?)\:\}/) {
        my $notefile = $1;
        $notefile =~ s/^pc/p/;
        my $colspan = ($only) ? 1 : 2;
        print "<TR><TD COLSPAN=$colspan WIDTH=100% $background VALIGN=MIDDLE ALIGN=CENTER>\n"
          . "<IMG SRC=\"$imgurl/$notefile.gif\" WIDTH=80%></TD></TR>\n";
      }
    }
    print "<TD $background VALIGN=TOP WIDTH=$width%" . ($lang1 ne $lang || $text =~ /{omittitur}/ ? "" : " ID=$hora$searchind") . ">";
    topnext_cell($lang);

    if ($text =~ /%(.*?)%/) {
      my $q = $1;

      if ($officium =~ /Pofficium/i) {
        if ($hora =~ /Matutinum/i) {
          $text =~
            s{%(.*?)%}{<a href="Pofficium.pl?date1=$date1&caller=$caller&command=prayLaudes&version=$version&testmode=$testmode&lang2=$lang2&votive=$votive">$q</a>}i;
        } elsif ($hora =~ /Vespera/i) {
          $text =~
            s{%(.*?)%}{<a href="Pofficium.pl?date1=$date1&caller=1&command=prayVespera&version=$version&testmode=$testmode&lang2=$lang2&votive=C9">$q</a>}i;
        } elsif ($hora =~ /Laudes/i) {
          $text =~
            s{%(.*?)%}{<a href="Pofficium.pl?date1=$date1&caller=1&command=prayMatutinum&version=$version&testmode=$testmode&lang2=$lang2&votive=C9">$q</a>}i;
        }
      } else {
        if ($hora =~ /Matutinum/i) {
          $text =~ s{%(.*?)%}{<a href=# onclick="hset('Laudes');">$q</a>}i;
        } elsif ($hora =~ /Vespera/i) {
          $text =~ s{%(.*?)%}{<a href=# onclick="defunctorum('Vespera');">$q</a>}i;
        } elsif ($hora =~ /Laudes/i) {
          $text =~ s{%(.*?)%}{<a href=# onclick="defunctorum('Matutinum');">$q</a>}i;
        }
      }
    }
  }
  $text =~ s/wait[0-9]+//ig;
  $text =~ s/\_/ /g;
  $text =~ s/\{\:.*?\:\}(<BR>)*\s*//g;
  $text =~ s/\{\:.*?\:\}//sg;
  $text =~ s/\`//g;

  if ($Ck) {
    if ($column == 1) {
      push(@ctext1, $text);
    } else {
      push(@ctext2, $text);
    }
  } else {
    print setfont($blackfont, $text) . "</TD>\n";
    if (!columnsel($lang) || $only) { print "</TR>\n"; }
  }
}

#*** topnext_Cell()
#prints T N for positioning
sub topnext_cell {
  if ($officium =~ /Pofficium/i) { return; }
  my $lang = shift;
  my @a = split('<BR>', $text1);
  if (@a > 2 && $expand !~ /skeleton/i) { 
    my $str = "<DIV ALIGN=right><FONT SIZE=1 COLOR=green>";
    if (columnsel($lang)) {
      $str .= "<a href='#${hora}top'>Top</a>&nbsp;&nbsp;";
      $str .= "<a href='#$hora" . ($searchind+1) . "'>Next</a>";
    } else {
      $str .= "$searchind";
    }
    $str .= "</FONT></DIV>\n";
    print $str;
  }
}

#*** table_start
# start main table
sub table_start {
  if ($Ck) {
    @ctext1 = splice(@ctext1, @ctext1);
    @ctext2 = splice(@ctext2, @ctext2);
  }
  my $width =
    ($textwidth && $textwidth =~ /^[0-9]+$/ && 0 < $textwidth && $textwidth <= 100)
    ? "$textwidth\%"
    : '80%';
  print "<TABLE BORDER=$border ALIGN=CENTER CELLPADDING=8 WIDTH=$width>";
}

#antepost('$title')
# prints Ante of Post call
sub ante_post {
  my $title = shift;
  if ($Ck) { return; }
  my $colspan = ($only) ? '' : 'COLSPAN=2';
  print "<TR><TD $background VALIGN=TOP $colspan ALIGN=CENTER>\n";
  if ($0 =~ /missa/) {
    print "<a href=\"mpopup.pl?popup=$title&rubrics=$rubrics&lang1=$lang1&lang2=$lang2\" TARGET=_NEW>$title</a>\n";
    print "<FONT SIZE=1>Missam</FONT></TD></TR>";
  } else {
    print "<INPUT TYPE=RADIO NAME=link onclick='linkit(\"\$$title\", 0, \"Latin\");'>\n";
    print "<FONT SIZE=1>$title Divinum officium</FONT></TD></TR>";
  }
}

#table_end()
# finishes main table
sub table_end {
  if ($Ck) {
    my $width = ($only) ? 100 : 50;
    print "<TR><TD $background VALIGN=TOP WIDTH=$width%>\n";
    my $item;
    my $len1 = 0;
    foreach $item (@ctext1) { print "$item<BR>\n"; $len1 += wnum($item); }
    print "</TD>\n";

    if (!$only) {
      $len2 = 0;
      print "<TD $background VALIGN=TOP WIDTH=$width%>\n";
      foreach $item (@ctext2) { print "$item<BR>\n"; $len2 += wnum($item); }
      print "</TD></TR>\n";
    }
    print "<TR><TD $background VALIGN=TOP WIDTH=$width%><FONT SIZE=1>$len1 words</FONT></TD>";

    if (!$only) {
      print "<TD $background VALIGN=TOP WIDTH=$width%><FONT SIZE=1>$len2 words</FONT></TD></TR>";
    }
  }
  print "</TABLE><A ID='$hora$searchind'></A>";
}

sub wnum {
  my $item = shift;
  $item =~ s/\<.*?\>//g;
  $item =~ s/\s[a-z]\.\s//ig;
  $item =~ s/[0-9,.,;:\-*]//g;
  $item =~ s/[\{\[\(].*?[\}\]\)]//g;
  $item =~ s/\s+/ /g;
  my @item = split(' ', $item);
  my $n = @item;
  return $n;
}

#*** linkcode($name, $ind, $lang, $disabled)
# set a link line
sub linkcode {
  my ($name, $ind, $lang, $disabled) = @_;
  return "<INPUT TYPE=RADIO NAME=link $disabled onclick='linkit(\"$name\", $ind, \"$lang\");'>";
}

#*** linkcode1()
# sets a collpse radiobutton
sub linkcode1 {
  return "&nbsp;&nbsp;&nbsp;" . "<INPUT TYPE=RADIO NAME=collapse onclick=\"linkit('','10000','');\">\n";
}

sub option_selector {
  my ($label, $onchange, $default, @options) = @_;
  my $id = $label; $id =~ s/\s+//g; $id = lc($id);
  my $output = "<label for=$id class='offscreen'>$label</label>\n";
  $output .= sprintf("<select id=%s NAME=%s size=%d onchange=\"%s\">\n", $id, $id, @options + 0, $onchange);
  foreach (@options) {
    my($display, $value) = split(/;/);
    $value = $display unless $value;
    $output .= sprintf("<option %s value=\"%s\">%s\n", ($value eq $default)?'selected':'', $value, $display);
  }
  return $output . "</select>\n"
}

#*** selectables
# generate selects from .dialog data
sub selectables {
  my($dialog) = @_;
  my(@output);
  foreach (split(/;;\n*/, getdialog($dialog))) {
    my($parname, $parvar, $parmode, $parpar, $parpos, $parfunc, $parhelp) = split('~>');
    my $parvalue = eval($parvar);
    my $parlabel = $parname;
    $parname = substr($parvar, 1);
    my $output = "<label for=$parname class=offscreen>$parlabel</label>\n";
    $output .= htmlInput($parname, $parvalue, $parmode, $parpar, 'parchange()', $parhelp);
    push(@output, $output);
  }
  join('', @output);
}

#*** selectable_p
# generate signle select from .dialog for Poffice
sub selectable_p {
  my($dialog, $curvalue, $date1, $version, $lang2, $votive, $testmode, $title) = @_;
  $title ||= ucfirst($dialog);
  if ($dialog eq 'votives') { $curvalue ||= 'Hodie' }
  my @output = ("<tr><td>$title");
  foreach (getdialog($dialog)) { chomp;
    my($text,$name) = split(/\//);
    $name ||= $text;
    my $href = "Pofficium.pl?date1=$date1&version="
             . ($dialog eq 'versions' ? $name : $version)
             . "&testmode=$testmode&lang2="
             . ($dialog eq 'languages' ? $name : $lang2)
             . "&votive="
             . ($dialog eq 'votives' ? $name : $votive);
    my $colour = $curvalue eq $name ? 'var(--red)' : 'var(--blue)';
    push(@output, qq(\n<a href="$href" style='color: $colour;'>$text</a>));
  }
  join('', @output) . "</td></tr>\n";
}

sub horas_menu {
  my($completed, $date1, $version, $lang2, $votive, $testmode) = @_;
  my @horas = gethoras($votive eq 'C9');
  push(@horas, 'Omnia', 'Plures') if ($0 !~ /Cofficium/);

  my $i  = 0;
  my $output = '';
  foreach (@horas) {
    $i += 1;
    my $href = '#';
    my $onclick = '';
    if ($0 =~ /Pofficium/) {
      $href = qq("Pofficium.pl?date1=$date1&command=pray$_)
            . qq(&version=$version&testmode=$testmode&lang2=$lang2&votive=$votive")
    } else {
      $onclick = qq(onclick="hset('$_');");
    }
    my $colour = $i <= $completed ? 'var(--maroon)' : 'var(--blue)' ;
    $output .= qq(\n<a style="color: $colour" href=$href $onclick>$_</a>\n);
    if (($0 =~ /Pofficium/ && $votive ne 'C9' && ($i == 2 || $i == 6)) || (($i == (@horas - 2)) && ($0 !~ /Cofficium/))) {
      $output .= '<hr class="break">';
    } else {
      $output .= '';
    }
  }
  $output =~ s/&nbsp;&nbsp;$//;
  $output;
}

sub bottom_links_menu {
  join('', map { "<a href=\"../../www/horas/Help/" . lcfirst($_) . ".html\" target=\"_blank\">$_</a>\n";} 
            qw(Versions Credits Download Rubrics Technical Help));
}

