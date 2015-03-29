package com.krylysov.nsisplugin;

import com.intellij.lang.Language;

public class NsisLanguage extends Language {
    public static final NsisLanguage INSTANCE = new NsisLanguage();

    private NsisLanguage() {
        super("nsis");
    }
}