package com.krylysov.nsisplugin;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

public class NsisLexerAdapter extends FlexAdapter {
    public NsisLexerAdapter() {
        super(new NsisLexer((Reader) null));
    }
}