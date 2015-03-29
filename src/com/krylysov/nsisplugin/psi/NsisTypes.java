package com.krylysov.nsisplugin.psi;


import com.intellij.psi.tree.IElementType;

public interface NsisTypes {
    IElementType BLOCK_DECLARATION = new NsisTokenType("BLOCK_DECLARATION");
    IElementType INSTRUCTION = new NsisTokenType("INSTRUCTION");
    IElementType COMMENT = new NsisTokenType("COMMENT");
    IElementType COMPILER_COMMAND = new NsisTokenType("COMPILER_COMMAND");
    IElementType CONSTANT = new NsisTokenType("CONSTANT");
    IElementType IDENTIFIER = new NsisTokenType("IDENTIFIER");
    IElementType KEYWORD = new NsisTokenType("KEYWORD");
    IElementType NEWLINE = new NsisTokenType("NEWLINE");
    IElementType NUMBER = new NsisTokenType("NUMBER");
    IElementType SPECIAL_SYMBOL = new NsisTokenType("SPECIAL_SYMBOL");
    IElementType PLUGIN_CALL = new NsisTokenType("PLUGIN_CALL");
    IElementType STRING = new NsisTokenType("STRING");
    IElementType VALUE = new NsisTokenType("VALUE");
    IElementType VARIABLE = new NsisTokenType("VARIABLE");
}
