import 'dart:convert';

class ProfileModel {
    final SocialLinks socialLinks;
    final String id;
    final User user;
    final String bio;
    final String location;
    final String website;
    final String phoneNumber;
    final String gender;
    final DateTime dateOfBirth;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    ProfileModel({
        required this.socialLinks,
        required this.id,
        required this.user,
        required this.bio,
        required this.location,
        required this.website,
        required this.phoneNumber,
        required this.gender,
        required this.dateOfBirth,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    ProfileModel copyWith({
        SocialLinks? socialLinks,
        String? id,
        User? user,
        String? bio,
        String? location,
        String? website,
        String? phoneNumber,
        String? gender,
        DateTime? dateOfBirth,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        ProfileModel(
            socialLinks: socialLinks ?? this.socialLinks,
            id: id ?? this.id,
            user: user ?? this.user,
            bio: bio ?? this.bio,
            location: location ?? this.location,
            website: website ?? this.website,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            gender: gender ?? this.gender,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        socialLinks: SocialLinks.fromJson(json["socialLinks"]),
        id: json["_id"],
        user: User.fromJson(json["user"]),
        bio: json["bio"],
        location: json["location"],
        website: json["website"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "socialLinks": socialLinks.toJson(),
        "_id": id,
        "user": user.toJson(),
        "bio": bio,
        "location": location,
        "website": website,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SocialLinks {
    final String facebook;
    final String instagram;

    SocialLinks({
        required this.facebook,
        required this.instagram,
    });

    SocialLinks copyWith({
        String? facebook,
        String? instagram,
    }) => 
        SocialLinks(
            facebook: facebook ?? this.facebook,
            instagram: instagram ?? this.instagram,
        );

    factory SocialLinks.fromRawJson(String str) => SocialLinks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        facebook: json["facebook"],
        instagram: json["instagram"],
    );

    Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "instagram": instagram,
    };
}

class User {
    final String id;
    final String name;
    final String email;
    final String number;
    final String role;
    final bool isVerified;
    final int v;
    final String resetPasswordCode;
    final DateTime resetPasswordExpiry;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.number,
        required this.role,
        required this.isVerified,
        required this.v,
        required this.resetPasswordCode,
        required this.resetPasswordExpiry,
    });

    User copyWith({
        String? id,
        String? name,
        String? email,
        String? number,
        String? role,
        bool? isVerified,
        int? v,
        String? resetPasswordCode,
        DateTime? resetPasswordExpiry,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            number: number ?? this.number,
            role: role ?? this.role,
            isVerified: isVerified ?? this.isVerified,
            v: v ?? this.v,
            resetPasswordCode: resetPasswordCode ?? this.resetPasswordCode,
            resetPasswordExpiry: resetPasswordExpiry ?? this.resetPasswordExpiry,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        number: json["number"],
        role: json["role"],
        isVerified: json["isVerified"],
        v: json["__v"],
        resetPasswordCode: json["resetPasswordCode"],
        resetPasswordExpiry: DateTime.parse(json["resetPasswordExpiry"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "number": number,
        "role": role,
        "isVerified": isVerified,
        "__v": v,
        "resetPasswordCode": resetPasswordCode,
        "resetPasswordExpiry": resetPasswordExpiry.toIso8601String(),
    };
}
