package com.company;

import java.util.TimerTask;

public class MyTimerTask extends TimerTask {
    Chat chat;

    public MyTimerTask(Chat chat){
        this.chat = chat;
    }

    @Override
    public void run() {
        boolean isUnread = chat.checkUnreadMessage();
        if (isUnread) {
            System.out.println("Neue Nachricht!");
        }
    }
}
