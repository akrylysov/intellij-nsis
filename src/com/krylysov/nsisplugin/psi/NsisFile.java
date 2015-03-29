package com.krylysov.nsisplugin.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import com.krylysov.nsisplugin.NsisFileType;
import com.krylysov.nsisplugin.NsisLanguage;
import org.jetbrains.annotations.NotNull;

public class NsisFile extends PsiFileBase {
    public NsisFile(@NotNull FileViewProvider viewProvider) {
        super(viewProvider, NsisLanguage.INSTANCE);
    }

    @NotNull
    @Override
    public FileType getFileType() {
        return NsisFileType.INSTANCE;
    }

    @Override
    public String toString() {
        return "NSIS File";
    }

    /*@Override
    public Icon getIcon(int flags) {
        return super.getIcon(flags);
    }*/
}