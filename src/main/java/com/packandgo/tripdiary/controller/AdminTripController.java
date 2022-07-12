package com.packandgo.tripdiary.controller;

import com.packandgo.tripdiary.exception.TripNotFoundException;
import com.packandgo.tripdiary.model.Image;
import com.packandgo.tripdiary.model.Trip;
import com.packandgo.tripdiary.model.VisitPlace;
import com.packandgo.tripdiary.payload.response.MessageResponse;
import com.packandgo.tripdiary.payload.response.PagingResponse;
import com.packandgo.tripdiary.payload.response.TripResponse;
import com.packandgo.tripdiary.service.ReactService;
import com.packandgo.tripdiary.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin/trips")
public class AdminTripController {
    private final TripService tripService;
    private final ReactService reactService;

    @Autowired
    public AdminTripController(TripService tripService, ReactService reactService) {
        this.tripService = tripService;
        this.reactService = reactService;
    }

    @GetMapping("")
    public ResponseEntity<?> getAllTrips(
            @RequestParam(defaultValue = "1", required = false) int page,
            @RequestParam(defaultValue = "10", required = false) int size
    ) {
        page = page <= 0 ? 1 : page;
        Page<Trip> trips = tripService.getTrips(page, size);
        List<TripResponse> tripResponses = trips
                .stream()
                .map(t -> t.toResponse())
                .collect(Collectors.toList());

        PagingResponse<TripResponse> response = new PagingResponse<>(page, size, trips.getTotalPages(), tripResponses);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getTrip(@PathVariable(name = "id") String id) {

        long tripId = parseId(id);
        Trip trip = tripService.get(tripId);
        TripResponse tripResponse = trip.toResponse();

        tripResponse.setNumOfLikes(reactService.countLikes(tripId));
        return ResponseEntity.ok(tripResponse);
    }

    @GetMapping("/{id}/images")
    public ResponseEntity<?> getImagesForTrip(@PathVariable(name = "id") String id) {

        long tripId = parseId(id);
        Trip trip = tripService.get(tripId);
        List<Image> images = new ArrayList<>();
        trip.getVisitDays().stream().forEach(day -> {
            if (day.getVisitPlaces() != null && day.getVisitPlaces().size() > 0) {
                for (VisitPlace place : day.getVisitPlaces()) {
                    if (place.getImages() != null & place.getImages().size() > 0) {
                        for (Image image : place.getImages()) {
                            images.add(image);
                        }
                    }
                }
            }
        });
        return ResponseEntity.ok(images);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTrip(@PathVariable(name = "id") String id) {
        long tripId = parseId(id);
        tripId = Long.parseLong(id);
        Trip trip = tripService.removeTrip(tripId);

        return ResponseEntity.ok(trip);
    }

    private long parseId(String id) {
        long longId = 0;
        try {
            longId = Long.parseLong(id);
        } catch (Exception ex) {
            throw new TripNotFoundException("Trip not found");
        }
        return longId;
    }

}
