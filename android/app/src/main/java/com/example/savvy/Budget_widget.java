package com.example.savvy;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.BitmapFactory;
import android.widget.RemoteViews;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;

import es.antonborri.home_widget.HomeWidgetPlugin;

/**
 * Implementation of App Widget functionality.
 */
public class Budget_widget extends AppWidgetProvider {

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {


        for (int appWidgetId : appWidgetIds) {
            // There may be multiple widgets active, so update all of them
            SharedPreferences widgetData = HomeWidgetPlugin.Companion.getData(context);
            RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.budget_widget);
            String base64 =widgetData.getString("view", "View");
            byte[] byteArr = Base64.decode(base64, 0);
            views.setImageViewBitmap(R.id.widget_image, BitmapFactory.decodeByteArray(byteArr, 0, byteArr.length));
            appWidgetManager.updateAppWidget(appWidgetId, views);
        }
    }

}