package com.mspr.arosaje.config.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.HashMap;
import java.util.Map;

public class ChatWebSocketHandler extends TextWebSocketHandler {

    private Map<String, WebSocketSession> sessions = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.put(session.getId(), session);
        // Logique lorsque la connexion WebSocket est établie
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // Traiter les messages entrants
        String receivedMessage = message.getPayload();

        // Envoyer un message au client qui a envoyé le message
        session.sendMessage(new TextMessage("Message reçu : " + receivedMessage));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session.getId());
        // Logique lorsque la connexion WebSocket est fermée
    }
}
