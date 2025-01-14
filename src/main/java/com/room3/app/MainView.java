package com.room3.app;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.Label;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

@Route("")
public class MainView extends VerticalLayout {
    public MainView() {
        Label label = new Label("Hello, Vercel!");
        Button button = new Button("Click Me", e -> label.setText("You clicked the button!"));
        add(label, button);
    }
}
