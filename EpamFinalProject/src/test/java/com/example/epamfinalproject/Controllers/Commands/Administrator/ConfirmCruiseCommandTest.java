package com.example.epamfinalproject.Controllers.Commands.Administrator;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.example.epamfinalproject.Controllers.Commands.Command;
import com.example.epamfinalproject.Controllers.Path;
import com.example.epamfinalproject.Database.Interfaces.CruiseDAO;
import com.example.epamfinalproject.Services.CruiseService;
import com.example.epamfinalproject.Utility.Constants;
import com.example.epamfinalproject.Utility.FieldKey;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

class ConfirmCruiseCommandTest {
  private static HttpServletRequest request;
  private static HttpSession session;
  private static Command command;

  @BeforeAll
  static void beforeAll() {
    request = mock(HttpServletRequest.class);
    session = mock(HttpSession.class);
    command = new ConfirmCruiseCommand(new CruiseService(mock(CruiseDAO.class)));
  }

  @Test
  void confirmCruiseEmptyTest() {

    when(request.getSession()).thenReturn(session);
    when(request.getParameterValues(FieldKey.ENTITY_ID)).thenReturn(new String[]{});

    assertEquals(Constants.REDIRECT + Path.CATALOGUE_PAGE, command.execute(request));
  }

    @ParameterizedTest
    @ValueSource(strings = {"3", "2", "12", "1"})
    void confirmCruiseFilledTest(String id) {
    when(request.getSession()).thenReturn(session);
        when(request.getParameter(FieldKey.ENTITY_ID)).thenReturn(id);

        assertEquals(Constants.REDIRECT + Path.CATALOGUE_PAGE, command.execute(request));
  }

  @ParameterizedTest
  @ValueSource(strings = {"-3", "-2", "-12", "0"})
  void confirmNegativeCruiseTest(String id) {
    when(request.getSession()).thenReturn(session);
    when(request.getParameter(FieldKey.ENTITY_ID)).thenReturn(id);

    assertEquals(Constants.REDIRECT + Path.ADMINISTRATOR_PAGE, command.execute(request));
  }
}
