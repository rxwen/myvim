if glob('AndroidManifest.xml') =~ ''
    if filereadable('project.properties') 
        let s:comp_separator = '/'
        let s:path_separator = ':'
        if has('win32')
            let s:comp_separator = '\\'
            let s:path_separator = ';'
        endif

        " find out the android sdk dir 
        vimgrep /sdk.dir=/j local.properties
        let s:androidSdkPath = split(getqflist()[0].text, '=')[1] 
        " find out the target platform of android project
        vimgrep /target=/j project.properties
        let s:androidTargetPlatform = split(getqflist()[0].text, '=')[1] 
        let s:targetAndroidJar = s:androidSdkPath . s:comp_separator . 'platforms' . s:comp_separator . s:androidTargetPlatform . s:comp_separator . 'android.jar'
        if $CLASSPATH =~ ''
            let $CLASSPATH = s:targetAndroidJar . s:path_separator . $CLASSPATH
        else
            let $CLASSPATH = s:targetAndroidJar
        endif
    end
endif

setlocal omnifunc=javacomplete#Complete
setlocal completefunc=javacomplete#Complete
