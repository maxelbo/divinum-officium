sub bodybegin {
  my $onload = $officium ne 'Pofficium.pl' && ' onload="startup();"';
  return << "PrintTag";
<body vlink=$visitedlink link=$link $onload>
<form action="$officium" method=post target=_self>
PrintTag
}

#*** headline($head) prints headline for main and pray
sub headline {
  my ($day, $comment, $color) = @_;
  my $output = "<div class='header-day'><span style='color: $color'>$day</span>\n$comment</div>";
  $output .= << "PrintTag";
<div class="main-title">
  <h1>Divinum Officium</h1>
  <h2>$version</h2>
</div>
PrintTag
  if ($officium ne 'Pofficium.pl') {
    $output .= << "PrintTag";
<div class="main-menu-pc">
  <div>
    <a href=# onclick="callcompare()">Compare</a>
    <a href=# onclick="callmissa()">Sancta Missa</a>
  </div>
  <div class="date">
    <a href=# onclick="prevnext(-1)">
      <span class="material-symbols-outlined">
        arrow_back
      </span>
    </a>
    <label for=date class=offscreen>Date</label>
    <input type=text id=date name=date value="$date1" size=10>
    <button class="date-button" type=submit value=" " onclick="parchange()"></button>
    <a href=# onclick="prevnext(1)">
      <span class="material-symbols-outlined">
        arrow_forward
      </span>
    </a>
  </div>
  <div>
    <a href=# onclick="callkalendar()">Ordo</a>
    <a href=# onclick="pset('parameters')">Options</a>
  </div>
</div>
PrintTag
  } else {
    $output .= << "PrintTag";
    <div class="date">
      <a href="Pofficium.pl?date1=$date1&command=prev&version=$version&testmode=$testmode&lang2=$lang2&votive=$votive">
        <span class="material-symbols-outlined">
          arrow_back
        </span>
      </a>
      <p>$date1</p>
      <a href="Pofficium.pl?date1=$date1&command=next&version=$version&testmode=$testmode&lang2=$lang2&votive=$votive">
        <span class="material-symbols-outlined">
          arrow_forward
        </span>
      </a>
    </div>
PrintTag
  }
}

sub mainpage {
  my $height = floor($screenheight * 4 / 14);
  my $height2 = floor($height / 2);
  return << "PrintTag";
<div class="for-sp">
  <div class="image-table-sp">
    <img src="$htmlurl/psalterium.png" height=$height2 alt="psalterium">
  </div>
</div>
<div class="for-pc">
  <table class="image-table-pc" border=0 height=$height>
  <tr>
    <td>Ordinarium</td>
    <td>Psalterium</td>
    <td>Proprium de Tempore</td>
  </tr>
  <tr>
    <td rowspan=2>
      <img src="$htmlurl/breviarium.png" height=$height alt="breviarium">
      </td>
    <td>
      <img src="$htmlurl/psalterium.png" height=$height2 alt="psalterium">
    </td>
    <td>
      <img src="$htmlurl/tempore.png" height=$height2 alt="tempore">
    </td>
  </tr>
  <tr>
    <td>
    <img src="$htmlurl/commune.png" height=$height2 alt="commune"></td>
    <td height=50%>
    <img src="$htmlurl/sancti.png" height=$height2 alt="sancti"></td>
  </tr>
  <tr>
    <td style="color: var(--red)"></td>
    <td>Commune Sanctorum</td>
    <td>Proprium Sanctorum</td>
  </tr>
  </table>
</div>
PrintTag
}

sub setplures {
  my $output = << "PrintTag";
<H2>Elige horas</H2>
<TABLE WIDTH=75% CELLPADDING=5 ALIGN=CENTER>
PrintTag

  foreach (gethoras($votive eq 'C9')) {
    $output .= "<TR><TD WIDTH='50%' ALIGN=RIGHT>$_</TD><TD ALIGN=LEFT>" 
             . htmlInput($_, 0 + ($plures =~ $_), 'checkbutton') ."</TD></TR>";
  }

  $output .= "</TABLE>";
  my $submit = << "SubmitTag";
thisform = document.forms[0];
thisform.command.value = "pray";
for(i=0; i<thisform.elements.length; i++) {
  if (thisform.elements[i].checked) {  
    thisform.command.value += thisform.elements[i].name;
  }
}
thisform.target = "_self";
thisform.submit();
SubmitTag

  $output .= par_c("<INPUT TYPE=SUBMIT VALUE='Procede' ONCLICK='$submit'>")
}

# for Pofficium Options Sancta Missa Ordo
sub pmenu {
  return << "PrintTag";
<div class="pmenu">
  <a href="Pofficium.pl?date1=$date1&command=setupparameters&pcommand=$command&version=$version&testmode=$testmode&lang2=$lang2&votive=$votive">
    Options
  </a>
  <a href=# onclick="callmissa();">
    Sancta Missa
  </a>
  <a href=# onclick="callkalendar();">
    Ordo
  </a>
</div>
PrintTag
}

#common end for programs
sub bodyend { 
  my $output = '';
  if ($error) { $output .= par_c("<FONT COLOR=var(--red)>$error</FONT>"); }
  if ($debug) { $output .= par_c("<FONT COLOR=var(--blue)>$debug</FONT>"); }
  $output .= << "PrintTag";
<INPUT TYPE=HIDDEN NAME=expandnum VALUE="">
<INPUT TYPE=HIDDEN NAME=popup VALUE="">
<INPUT TYPE=HIDDEN NAME=popuplang VALUE="">
<INPUT TYPE=HIDDEN NAME=setup VALUE="$setupsave">
<INPUT TYPE=HIDDEN NAME=command VALUE="$command">
<INPUT TYPE=HIDDEN NAME=date1 VALUE="$date1">
<INPUT TYPE=HIDDEN NAME=searchvalue VALUE="0">
<INPUT TYPE=HIDDEN NAME=officium VALUE="$officium">
<INPUT TYPE=HIDDEN NAME=browsertime VALUE="$browsertime">
<INPUT TYPE=HIDDEN NAME=version1 VALUE="$version">
<INPUT TYPE=HIDDEN NAME=caller VALUE='0'>
<INPUT TYPE=HIDDEN NAME=compare VALUE=0>
<INPUT TYPE=HIDDEN NAME='notes' VALUE="$notes">
<INPUT TYPE=HIDDEN NAME='plures' VALUE='$plures'>
</form>
<script>
  // https redirect
  if (location.protocol !== 'https:' && (location.hostname == "divinumofficium.com" || location.hostname == "www.divinumofficium.com")) {
      location.replace(`https:\${location.href.substring(location.protocol.length)}`);
  }
</script>
</body>
</html>
PrintTag
}

sub buildscript {
  local($_) = @_;
  s/[\n]+/<BR>/g;
  s/\_//g;
  s/\,\,\,/\&nbsp\;\&nbsp\;\&nbsp\;/g;
  return << "PrintTag";
<TABLE BORDER=3 ALIGN=CENTER WIDTH=60% CELLPADDING=8><TR><TD>
$_
</TD></TR><TABLE><BR>
PrintTag
}

sub par_c {
  "<P ALIGN=CENTER>@_</P>\n";
}

1;
