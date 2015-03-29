package com.krylysov.nsisplugin;

import com.intellij.openapi.fileTypes.LanguageFileType;
import com.intellij.openapi.fileTypes.StdFileTypes;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import javax.swing.*;

public class NsisFileType extends LanguageFileType {
    public static final NsisFileType INSTANCE = new NsisFileType();

    private NsisFileType() {
        super(NsisLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public String getName() {
        return "NSIS script";
    }

    @NotNull
    @Override
    public String getDescription() {
        return "NSIS installer script";
    }

    @NotNull
    @Override
    public String getDefaultExtension() {
        return "nsi";
    }

    @Nullable
    @Override
    public Icon getIcon() {
        return StdFileTypes.PLAIN_TEXT.getIcon();
    }
}