package com.experteer.career.push;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.NotificationCompat;
import android.util.Log;

import com.experteer.career.CordovaApp;
import com.experteer.career.R;
import com.google.android.gcm.GCMBroadcastReceiver;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.plugin.gcm.GCMIntentService;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by Florian Dootz on 29.01.2015.
 *
 * Matthias: com.experteer.career.CordovaApp and com.experteer.career.R are
 * not defined here but in the career app. 
 */
public class ExtendedGcmIntentService extends GCMIntentService {
    private static final String TAG = ExtendedGcmIntentService.class.getSimpleName();

    private String notificationTitle = "";
    private int notificationId = 1;

    @Override
    protected void onMessage(Context context, Intent intent) {
        Log.d(TAG, "### Handling incoming google cloud messaging broadcast");

        // Get all extras
        Bundle extras = intent.getExtras();
        String from = extras.getString("from");
        String collapseKey = extras.getString("collapse_key");
        String message = extras.getString("message");
        JSONObject customData;

        try {
            String customDataString = extras.getString("custom_data");
            if (customDataString != null) {
                customData = new JSONObject(customDataString);
                createUrlNotification(context.getResources().getString(R.string.app_name), message, customData.getString("p"));
            }
        }
        catch (JSONException e) {
            e.printStackTrace();
        }
    }

    // Put the message into a notification and post it.
    // This is just one simple example of what you might choose to do with
    // a GCM message.
    private void createUrlNotification(String title, String msg, String url) {
        Log.d(TAG, "### Creating notification with url (" + url + ") and message (" + msg + ")");

        NotificationManager mNotificationManager = (NotificationManager) this.getSystemService(Context.NOTIFICATION_SERVICE);

        Intent openUrlIntent = new Intent(this, CordovaApp.class);
        openUrlIntent.putExtra("url", url);

        PendingIntent contentIntent = PendingIntent.getActivity(this, createUniqueNotificationId(), openUrlIntent, PendingIntent.FLAG_ONE_SHOT);

        NotificationCompat.Builder mBuilder = new NotificationCompat.Builder(this)
            .setSmallIcon(R.drawable.ic_notification)
            .setContentTitle(title)
            .setStyle(new NotificationCompat.BigTextStyle().bigText(msg))
            .setContentText(msg)
            .setAutoCancel(true);

        mBuilder.setContentIntent(contentIntent);
        mNotificationManager.notify(createUniqueNotificationId(), mBuilder.build());
    }

    public static int createUniqueNotificationId() {
        return (int) (System.currentTimeMillis() & 0xfffffff);
    }
}
