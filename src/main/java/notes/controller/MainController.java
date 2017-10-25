package notes.controller;

import notes.model.Note;
import notes.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private NoteService noteService;

    @GetMapping("/")
    public String home(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_HOME");
        return "index";
    }

    @GetMapping("/all-notes")
    public String allNotes(HttpServletRequest request) {
        request.setAttribute("notes", noteService.findAll());
        request.setAttribute("mode", "MODE_NOTES");
        return "index";
    }
    @GetMapping("/new-note")
    public String newNote(HttpServletRequest request) {
        request.setAttribute("mode", "MODE_NEW");
        return "index";
    }

    @PostMapping("/save-note")
    public String saveNote(@ModelAttribute Note note, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws IOException {
        note.setCreatedDate(new Date());
        noteService.save(note);
        request.setAttribute("notes", noteService.findAll());
        request.setAttribute("mode", "MODE_NOTES");
        response.sendRedirect("/all-notes");
        return "index";
    }

    @GetMapping("/update-note")
    public String updateNote(@RequestParam int id, HttpServletRequest request) {
        request.setAttribute("note", noteService.findOne(id));
        request.setAttribute("mode", "MODE_UPDATE");
        return "index";
    }

    @GetMapping("/delete-note")
    public String deleteNote(@RequestParam int id, HttpServletRequest request) {
        noteService.delete(id);
        request.setAttribute("notes", noteService.findAll());
        request.setAttribute("mode", "MODE_NOTES");
        return "index";
    }

}
