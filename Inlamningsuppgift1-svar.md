# Inlämningsuppgift, Automationsramverk

## Del 1

### Frågor

### _Vad för typ av historia kan man se i ett verktyg såsom Jenkins?_

> Jenkins är ett verktyg för att hantera mjukvara. Jenkins används
> för att bygga, testa och produktionssätta mjukvara.
> Jenkins har sitt ursprung i en programvara som hette Hudson. Hudson
> såg dagens ljus 2007. Efter lite turer fram och tillbaka så bestämdes det,
> i januari 2011, att man skulle göra en "fork" av Hudson-projektet och
> Jenkins-projektet såg dagens ljus.

### _Vad för typ av historia kan man se i ett verktyg såsom Git?_

> Git skapades av Linus Torvalds runt 2005 som ett verktyg för att hantera
> revisioner av programvarukoden för Linux-kärnan. Anledningaen var att han inte
> tyckte det fanns något verktyg som uppfyllde de önskemål han hade.

### _Vad är en pipeline i Jenkins?_

> En pipline är en uppsättning verktyg (plugins) som gör det möjligt att
> automatisera flödet för att bygga, testa och produktionssätta mjukvara.
> En pipline är som ett recept där man steg för steg beskriver vad som
> ska ske.

### _Beskriv vad Jenkins är samt alternativ till Jenkins_

> Jenkins är ledande vad gäller att erbjuda stöd för att bygga,
> produktionssätta och automatisera processen för att släppa
> nya versioner av t.ex websidor. I Jenkins så beskrivare man steg
> för steg vad som ska göras med mjukvaran. Det kan vara att utföra
> fördefinerade tester, att "bygga" ihop en applikation så att man
> sedan kan distribuera ut den till t.ex en website.
> Några alternativ är: CruiseControl, Integrity och Buddy.

### _Beskriv vad Ansible är samt alternativ till Ansible_

> Skapades av Michael DeHaan 2012. Ansible används för att konfigurera och
> automatisera utrullning av mjukvara. Detta görs genom så kallade playbooks som
> är filer med instruktioner hur man steg för steg gör utrullningen.
> Man kan även använda Ansible till att installera och konfigurera en server
> med nödvändiga programvara för att t.ex kunna köra den som en databas eller
> webserver. 
> Några alternativ är: Rudder, SaltStack och Chef.

## Del 2

### Praktisk tillämpning

### Ansible mot en webbserver

Sätt upp ett Ansible-projekt som du använder för att direkt deploya ut en webbserver.
Vad för webbsida du servrar på webbservern spelar ingen roll.
(Jenkins är inte inblandat här)
Programmet som ska deployas ut på servern är Lighthttpd:
<https://cloudwafer.com/blog/installing-lighttpd-web-server-on-debian-9/>

Dokumentera hur du gjort och hur du tänkt.

> Jag började med att leta upp information hur man installerar lighttpd
> på "vanligt" sätt. Sedan har jag helt enkelt gjort en playbook över
> de steg som ingår i installationen. Jag har även lagt till instruktioner
> för att starta lighttpd via Systemd. Jag gjorde även en mycket enkelt
> html-sida som kopieras in i web-serverns root folder.
> Jag har också gjort ett enkelt shell-script för installationen/deploy av web-servern.
> Filerna är: install-lighttpd.yml, deploy-website.yml och install-deploy-website.sh.

### Github, Jenkins mot en webbserver

Här skall du använda ditt tidigare Ansible-projekt, men du skall nu istället installera Jenkins på en server och sedan köra ansible på Jenkins servern.
<https://linuxize.com/post/how-to-install-jenkins-on-debian-10/>

När du sedan committar till Github in i master-branchen så skall Jenkins deploya ut din webbsida till webbservern automatiskt via webhooks.

> Här har jag gjort samma sak som med lighttpd och undersökt vilka steg som behövs
> för att installera Jenkins och Ansible samt hur man kopplar ihop GitHub med Jenkins.
> Dessa steg finns i 2 st playbooks, install-ansible.yml och install-jenkins.yml.
> Dessa körs via ett shell-script, install-jenkins-ansible.sh.
> För att få detta att fungera på ett smidigt sätt skapade jag ett RSA-nyckelpar
> för användaren jenkins. Den privata nyckeln har jag också lagt in i Jenkins.
> Den publika nyckeln har kopierats till webservern samt till GitHub (som en deplay key).
> I GitHub har jag även skapat en webhook för att på så sätt få GitHub att trigga Jenkins
> till att hämta den upplagda uppdateringen och skicka ut den på webservern.
>  
> Till playbook-filern hör även en fil, inventory.yml. Där finns bl.a information om
> ip-adresser till servrarna.
