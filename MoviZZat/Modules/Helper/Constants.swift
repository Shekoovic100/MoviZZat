//
//  Constants.swift
//  MoviZZat
//
//  Created by sherif on 18/07/2022.
//

import Foundation
import UIKit

struct Constants {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let apiKey = "a5f1b980a72b26fba552d7fdb96a1390"
    static let PopularMoviesCellID = "Cell"
    static let nowPlayingCellID = "Cell1"
    static let placeHolder = "movie place Holder"
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
    static let titleForSection = "TitleSection"
    static let URLString = "https://api.themoviedb.org/3/movie/"
    static let TvURLString = "https://api.themoviedb.org/3/tv/"
    static let TvEndpoint = "top_rated?api_key=\(Constants.apiKey)&language=en-US&page=1"
    static let TvEndpointPopular = "popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
    static let Endpoint = "now_playing?api_key=\(Constants.apiKey)&language=en-US&page=1"
    static let detialViewControllerIdentifier = "MovieDetailsVC"
    static let nowPlayingDetialViewControllerIdentifier = "NowPlayingDetailVC"
    static let cellIdTvShow = "TvShowTableViewCell"
    static let cellIdTvShowOnAir = "onAirCell"
    static let TvEndpointOnAir = "on_the_air?api_key=\(Constants.apiKey)&language=en-US&page=1"
    static let similarURL = "https://api.themoviedb.org/3/tv/"
    static let SimilarTvShowEndPoint = "90521/similar?api_key=\(Constants.apiKey)&language=en-US&page=1"
    static let similiarTvShowCellId = "similarCell"
    static let collectiontvShowCellId = "SimilarCellCollection"
    static let wishlistVCID = "WishlistVc"
    static let wishlistCellId = "WishlistCell"
    static let popularMovies = "https://api.themoviedb.org/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US&page=1"
}
