package com.krylysov.nsisplugin.psi;

import com.intellij.psi.tree.IElementType;
import com.krylysov.nsisplugin.NsisLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class NsisTokenType extends IElementType {
    public NsisTokenType(@NotNull @NonNls String debugName) {
        super(debugName, NsisLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "com.krylysov.nsisplugin.psi.NsisTokenType." + super.toString();
    }
}