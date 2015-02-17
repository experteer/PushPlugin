package com.experteer.career.push;

import android.content.Context;

import com.plugin.gcm.CordovaGCMBroadcastReceiver;

/**
 * Created by Florian Dootz on 29.01.2015.
 */
public class ExtendedGcmBroadcastReceiver extends CordovaGCMBroadcastReceiver {
    private static final String TAG = ExtendedGcmBroadcastReceiver.class.getSimpleName();

    @Override
    protected String getGCMIntentServiceClassName(Context context) {
    		return ExtendedGcmIntentService.class.getCanonicalName();
        //return "com.experteer.career.push."+ExtendedGcmIntentService.class.getSimpleName();
    }
}
