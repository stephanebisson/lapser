package com.lapser;

import com.calatrava.CalatravaPage;
import com.calatrava.shell.WebViewActivity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@CalatravaPage(name = "timerForm")
public class TimerForm extends WebViewActivity
{
  @Override
  protected String getPageName() {
    return "timerForm";
  }

  @Override
  protected List<String> getEvents() {
    return Arrays.asList("capture");
  }

  @Override
  protected List<String> getFields() {
    return Arrays.asList("label");
  }
}
