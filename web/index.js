"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GPoint3 = exports.Point3 = exports.Icosahedron = exports.HashProperties = void 0;
var M = require("../lib/geocomb-web.js");
/**
 * hash properties, stores point row & col for res on geocomb grid
 */
var HashProperties = /** @class */ (function () {
    function HashProperties(res, row, col, mo, rm) {
        // rm and mo can be either strings, or emscripten enum types
        this.res = res;
        this.row = row;
        this.col = col;
        // need to check if ready for MO & RM enums
        if (!Icosahedron.isReady) {
            throw new Error("runtime not ready yet (geocomb-web)");
        }
        if (typeof mo == "string") {
            this._mo =
                mo === "dymaxion" ? M.MapOrientation.dymaxion : M.MapOrientation.ECEF;
        }
        else {
            this._mo =
                mo == M.MapOrientation.dymaxion
                    ? M.MapOrientation.dymaxion
                    : M.MapOrientation.ECEF;
        }
        if (typeof rm == "string") {
            this._rm =
                rm === "quaternion"
                    ? M.RotationMethod.quaternion
                    : M.RotationMethod.gnomonic;
        }
        else {
            this._rm =
                rm == M.RotationMethod.quaternion
                    ? M.RotationMethod.quaternion
                    : M.RotationMethod.gnomonic;
        }
    }
    Object.defineProperty(HashProperties.prototype, "mo", {
        get: function () {
            return this._mo == M.MapOrientation.dymaxion ? "dymaxion" : "ECEF";
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(HashProperties.prototype, "rm", {
        get: function () {
            return this._rm == M.RotationMethod.quaternion ? "quaternion" : "gnomonic";
        },
        enumerable: false,
        configurable: true
    });
    return HashProperties;
}());
exports.HashProperties = HashProperties;
/**
 * Icosahedron class, used for hash generation
 */
var Icosahedron = /** @class */ (function () {
    /**
     * Icosahedron constructor
     * @param mapOrientation Icosahedron orientation on globe map
     * @param rotationMethod technique to use to rotate points
     */
    function Icosahedron(mapOrientation, rotationMethod) {
        if (mapOrientation === void 0) { mapOrientation = "ECEF"; }
        if (rotationMethod === void 0) { rotationMethod = "gnomonic"; }
        if (!Icosahedron.isReady) {
            throw new Error("runtime not ready yet (geocomb-web)");
        }
        this._mo =
            mapOrientation === "dymaxion"
                ? M.MapOrientation.dymaxion
                : M.MapOrientation.ECEF;
        this._rm =
            rotationMethod == "quaternion"
                ? M.RotationMethod.quaternion
                : M.RotationMethod.gnomonic;
        this._ico = new M.Icosahedron(this._mo, this._rm);
    }
    Object.defineProperty(Icosahedron.prototype, "mo", {
        get: function () {
            return this._mo == M.MapOrientation.dymaxion ? "dymaxion" : "ECEF";
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Icosahedron.prototype, "rm", {
        get: function () {
            return this._rm == M.RotationMethod.quaternion ? "quaternion" : "gnomonic";
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(Icosahedron, "isReady", {
        /**
         * since geocomb-web runs on WebAssembly, need to wait for it to be ready
         * @returns whether runtime is ready for geocomb-web
         */
        get: function () {
            return !!M.Icosahedron;
        },
        enumerable: false,
        configurable: true
    });
    /**
     *
     * @param mapOrientation Icosahedron orientation on globe map
     * @param rotationMethod technique to use to rotate points
     * @returns Promise that resolves with new Icosahedron instance
     */
    Icosahedron.onReady = function (mapOrientation, rotationMethod) {
        if (mapOrientation === void 0) { mapOrientation = "ECEF"; }
        if (rotationMethod === void 0) { rotationMethod = "gnomonic"; }
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                if (Icosahedron.isReady) {
                    return [2 /*return*/, new Icosahedron(mapOrientation, rotationMethod)];
                }
                else {
                    return [2 /*return*/, M().then(function (instance) {
                            // bit hacky but library doesnt do anything too complicated, should be ok
                            M = instance;
                            return new Icosahedron(mapOrientation, rotationMethod);
                        })];
                }
                return [2 /*return*/];
            });
        });
    };
    /**
     * generates point on globe, for use with Icosahedron#hash()
     * @param lat point latitude
     * @param lon point longitude
     * @retunrs Point3
     */
    Icosahedron.prototype.pointFromCoords = function (lat, lon) {
        return this._ico.pointFromCoords(lat, lon);
    };
    /**
     * generates hash for point
     * @param point point to hash
     * @param res geocomb grid resolution
     * @returns HashProperties for point on geocomb grid
     */
    Icosahedron.prototype.hash = function (point, res) {
        return this._ico.hash(point, res);
    };
    /**
     * parses hash, returning GPoint3 that's also phex center
     * @throws errors if invalid rotation methods or row or col numbers are provided
     * @param props hash properties
     * @returns GPoint3 that's also a phex center
     */
    Icosahedron.prototype.parseHash = function (props) {
        var mo = props.mo === "dymaxion"
            ? M.MapOrientation.dymaxion
            : M.MapOrientation.ECEF;
        var rm = props.rm == "quaternion"
            ? M.RotationMethod.quaternion
            : M.RotationMethod.gnomonic;
        return this._ico.parseHash({
            res: props.res,
            row: props.row,
            col: props.col,
            mo: mo,
            rm: rm,
        });
    };
    return Icosahedron;
}());
exports.Icosahedron = Icosahedron;
/**
 * Point class, used for storing locations
 */
var Point3 = /** @class */ (function () {
    /**
     * Point3 constructor
     * @param x point's x coordinate
     * @param y point's y coordinate
     * @param z point's z coordinate
     */
    function Point3(x, y, z, triNum, isPC) {
        if (triNum === void 0) { triNum = -1; }
        if (isPC === void 0) { isPC = false; }
        this.x = x;
        this.y = y;
        this.z = z;
        this.triNum = triNum;
        this.isPC = isPC;
    }
    return Point3;
}());
exports.Point3 = Point3;
/**
 * GPoint3 class, generated by Icosahedron, additionally stores row and col on geocomb grid for res
 */
var GPoint3 = /** @class */ (function (_super) {
    __extends(GPoint3, _super);
    // side-note: pretty much same as HashProperties, only difference is super call for x,y,z coords
    /**
     *
     * @param x
     * @param y
     * @param z
     * @param res
     * @param row
     * @param col
     * @param mo
     * @param rm
     * @param triNum
     * @param isPC
     */
    function GPoint3(x, y, z, res, row, col, mo, rm, triNum, isPC) {
        if (triNum === void 0) { triNum = -1; }
        if (isPC === void 0) { isPC = false; }
        var _this = _super.call(this, x, y, z, triNum, isPC) || this;
        // rm and mo can be either strings, or emscripten enum types
        _this.res = res;
        _this.row = row;
        _this.col = col;
        // need to check if ready for MO & RM enums
        if (!Icosahedron.isReady) {
            throw new Error("runtime not ready yet (geocomb-web)");
        }
        if (typeof mo == "string") {
            _this._mo =
                mo === "dymaxion" ? M.MapOrientation.dymaxion : M.MapOrientation.ECEF;
        }
        else {
            _this._mo =
                mo == M.MapOrientation.dymaxion
                    ? M.MapOrientation.dymaxion
                    : M.MapOrientation.ECEF;
        }
        if (typeof rm == "string") {
            _this._rm =
                rm === "quaternion"
                    ? M.RotationMethod.quaternion
                    : M.RotationMethod.gnomonic;
        }
        else {
            _this._rm =
                rm == M.RotationMethod.quaternion
                    ? M.RotationMethod.quaternion
                    : M.RotationMethod.gnomonic;
        }
        return _this;
    }
    Object.defineProperty(GPoint3.prototype, "mo", {
        get: function () {
            return this._mo == M.MapOrientation.dymaxion ? "dymaxion" : "ECEF";
        },
        enumerable: false,
        configurable: true
    });
    Object.defineProperty(GPoint3.prototype, "rm", {
        get: function () {
            return this._rm == M.RotationMethod.quaternion ? "quaternion" : "gnomonic";
        },
        enumerable: false,
        configurable: true
    });
    return GPoint3;
}(Point3));
exports.GPoint3 = GPoint3;
