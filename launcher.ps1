$host.UI.RawUI.WindowTitle = "Lunar Eclipser - Lunar Client Cracker"

echo "
 _                 _        _______  _______ 
( \      |\     /|( (    /|(  ___  )(  ____ )
| (      | )   ( ||  \  ( || (   ) || (    )|
| |      | |   | ||   \ | || (___) || (____)|
| |      | |   | || (\ \) ||  ___  ||     __)
| |      | |   | || | \   || (   ) || (\ (   
| (____/\| (___) || )  \  || )   ( || ) \ \__
(_______/(_______)|/    )_)|/     \||/   \__/
                                             "
echo "Lunar Eclipser Injector - made by victimize :3"

if ($args[0]) {
  $playerName = $args[0]
} else {
  $playerName = Read-Host -Prompt "Usuario "
}

if (-Not (Test-Path "$env:userprofile\.lunarclient\CrackedAccount.jar")) {
  echo "Downloading Agent"
  Invoke-WebRequest -Uri "https://github.com/a0-3/LunarEclipser/raw/main/CrackedAccount.jar" -OutFile "$env:userprofile\.lunarclient\CrackedAccount.jar"
}

$javaJre = (Resolve-Path "$env:userprofile\.lunarclient\jre\*\zulu17*\bin")[0]
cd "$env:userprofile\.lunarclient\offline\multiver"

$launchArgs = "--add-modules", "jdk.naming.dns", "--add-exports", "jdk.naming.dns/com.sun.jndi.dns=java.naming", "-Djna.boot.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-Dlog4j2.formatMsgNoLookups=true", "--add-opens", "java.base/java.io=ALL-UNNAMED", "-javaagent:$env:userprofile\.lunarclient\CrackedAccount.jar=$playerName", "-Xms1G", "-Xmx4000m", "-Xmn768m", "-XX:+DisableAttachMechanism", "-Djava.library.path=$env:userprofile\.lunarclient\offline\multiver\natives", "-cp", "lunar-lang.jar;lunar-emote.jar;lunar.jar;optifine-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar", "com.moonsworth.lunar.genesis.Genesis", "--version", "1.8.9", "--accessToken", "0", "--assetIndex", "1.8"
if ($args[1]) {
  $launchArgs += '--gameDir', $args[1]
}
$launchArgs += "--userProperties", "{}", "--texturesDir", "$env:userprofile\.lunarclient\textures", "--width", "854", "--height", "480", "--ichorClassPath", "lunar-lang.jar,lunar-emote.jar,lunar.jar,optifine-0.1.0-SNAPSHOT-all.jar,v1_8-0.1.0-SNAPSHOT-all.jar,common-0.1.0-SNAPSHOT-all.jar,genesis-0.1.0-SNAPSHOT-all.jar", "--ichorExternalFiles", "OptiFine_v1_8.jar", "--workingDirectory", ".", "--classpathDir", "$env:userprofile\.lunarclient\offline\multiver"

& "$javaJre\java.exe" $launchArgs